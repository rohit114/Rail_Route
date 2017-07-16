package com.rgraphics.railroot.railroute;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.drawable.AnimationDrawable;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.appindexing.Thing;
import com.google.android.gms.common.api.GoogleApiClient;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class MainActivity extends AppCompatActivity {


    AutoCompleteTextView text1;
    AutoCompleteTextView text2;
    AutoCompleteTextView text3;
    static ProgressDialog pd;

    final int size = 4;
    int[][] array = new int[size][size];
    int source_stID;
    int destination_stID;
    ArrayList<String> stationnames = new ArrayList<>();
    Map<String, String> trainroute = new HashMap<>();


    String[] cities = {"delhi", "mumbai", "jaipur", "bangalore", "patna", "lucknow", "bhopal", "guwahati", "kolkata", "bombay"};

    String[] day = {"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"};

    private GoogleApiClient client;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //animation code starts...
        final ImageView animImageView = (ImageView) findViewById(R.id.iv_animation);
        animImageView.setBackgroundResource(R.drawable.anim_girl);
        animImageView.post(new Runnable() {
            @Override
            public void run() {
                AnimationDrawable frameAnimation = (AnimationDrawable)
                        animImageView.getBackground();
                frameAnimation.start()

                ;
            }
        });




        //animation code ends..
        text1 = (AutoCompleteTextView) findViewById(R.id.edsource);
        text2 = (AutoCompleteTextView) findViewById(R.id.eddestination);

        load_station();


        load();
        load_route();
        ArrayAdapter<String> myadapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, cities);
        text1.setAdapter(myadapter);
        text1.setThreshold(1);

        text2.setAdapter(myadapter);
        //text2.setTokenizer(new MultiAutoCompleteTextView.CommaTokenizer());
        text2.setThreshold(1); text1.setAdapter(myadapter);
        text1.setThreshold(1);

        text2.setAdapter(myadapter);
        //text2.setTokenizer(new MultiAutoCompleteTextView.CommaTokenizer());
        text2.setThreshold(1);
        //*************************************************************************************


        //*************************************************************************************

        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }

    private void load() {
        String url = "http://araniisansthan.com/RailRoute/journey/";
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONArray jsonobject = new JSONArray(response);

                    for (int i = 0; i < size; i++) {
                        for (int j = 0; j < size; j++) {

                            int index = size * i + j;
                            int x = Integer.parseInt(jsonobject.get(index).toString());
                            Log.e("This is ROHIT's array", Integer.toString(x));
                            array[i][j] = x;
                        }
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this, "please refresh", Toast.LENGTH_SHORT).show();
            }
        });
        //Log.i("ROHIT MyAndroidClass", Arrays.toString(array));
        VolleyHelper.getInstance(getApplicationContext()).addToRequestQueue(request);
    }

    public void call(View view) {

        //text3 = (AutoCompleteTextView) findViewById(R.id.edday);


        //ArrayAdapter myadapter2 = new ArrayAdapter(this, android.R.layout.simple_list_item_1, day);

        //text3.setAdapter(myadapter2);
        //text3.setThreshold(1);

        String user_source = text1.getText().toString();
        String user_destination = text2.getText().toString();


        source_stID = stationnames.indexOf(user_source);
        destination_stID = stationnames.indexOf(user_destination);

        Log.e("ROHIT's source station", Integer.toString(source_stID));
        Log.e("ROHIT's dest station", Integer.toString(destination_stID));

        GraphAlgorithm gp = new GraphAlgorithm(array, size);
        ArrayList<String> list = gp.dijkstra(source_stID, destination_stID);
        Toast.makeText(MainActivity.this, list.toString(), Toast.LENGTH_LONG).show();
        ArrayList<String> result = new ArrayList<>();
        if (list.size() == 1 && "-1".equals(list.get(0)))
        {
            result.add("No Trains Found") ;
            Toast.makeText(MainActivity.this, result.toString(), Toast.LENGTH_LONG).show();
        }

        else
        {
            for(int i = 0 ; i < list.size()-2 ; i++)
            {
                String sr = list.get(i) ;
                String ds = list.get(i+1) ;
                String key_str = sr + "+" + ds ;
                String train = trainroute.get(key_str) ;
                int sr_ind =  Integer.parseInt(sr) ;
                int ds_ind = Integer.parseInt(ds) ;
                String sr_name = stationnames.get(sr_ind) ;
                String ds_name = stationnames.get(ds_ind) ;
                String to_add = sr_name + "->" + ds_name + " , "  + train ;
                result.add(to_add) ;
            }
            String total = user_source + "->"  +  user_destination + "=" + list.get(list.size()-1) + "Km." ;
            result.add(total) ;

            Intent i= new Intent(MainActivity.this,ResultView.class);
            i.putStringArrayListExtra("route",result);
            startActivity(i);
        }



    }

    //load station starts...
    public void load_station() {
        String url = "http://araniisansthan.com/RailRoute/station1/";
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONArray jsonobject = new JSONArray(response);
                    for (int i = 0; i < jsonobject.length(); i++) {
                        stationnames.add(jsonobject.get(i).toString());

                    }
                    Log.e("stations", stationnames.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this, "please refresh", Toast.LENGTH_SHORT).show();
            }
        });
        //Log.i("ROHIT MyAndroidClass", Arrays.toString(array));
        VolleyHelper.getInstance(getApplicationContext()).addToRequestQueue(request);
    }


    //load station ends...

    //load route starts...

    public void load_route() {
        String url = "http://araniisansthan.com/RailRoute/station/";
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonobject = new JSONObject(response);
                    for (int i = 0; i < size; i++) {
                        for (int j = 0; j < size; j++) {
                            String x = Integer.toString(i) + "+" + Integer.toString(j);
                            if (jsonobject.has(x)) {
                                trainroute.put(x, jsonobject.getString(x));
                                Log.e("route", x + jsonobject.getString(x));
                            }
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this, "please refresh", Toast.LENGTH_SHORT).show();
            }
        });
        //Log.i("ROHIT MyAndroidClass", Arrays.toString(array));
        VolleyHelper.getInstance(getApplicationContext()).addToRequestQueue(request);
    }

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    public Action getIndexApiAction() {
        Thing object = new Thing.Builder()
                .setName("Main Page") // TODO: Define a title for the content shown.
                // TODO: Make sure this auto-generated URL is correct.
                .setUrl(Uri.parse("http://[ENTER-YOUR-URL-HERE]"))
                .build();
        return new Action.Builder(Action.TYPE_VIEW)
                .setObject(object)
                .setActionStatus(Action.STATUS_TYPE_COMPLETED)
                .build();
    }

    @Override
    public void onStart() {
        super.onStart();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client.connect();
        AppIndex.AppIndexApi.start(client, getIndexApiAction());
    }

    @Override
    public void onStop() {
        super.onStop();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        AppIndex.AppIndexApi.end(client, getIndexApiAction());
        client.disconnect();
    }
    //ends..
}
