package com.rgraphics.railroot.railroute;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;

public class ResultView extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_view);
        Intent i = getIntent();
        ArrayList<String> trains = i.getStringArrayListExtra("route");
        ListView listView = (ListView)findViewById(R.id.list);
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,trains);
        assert listView != null;
        listView.setAdapter(arrayAdapter);
    }
}
