package com.rgraphics.railroot.railroute;

import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;

public class Splash extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        final ImageView animImageView = (ImageView) findViewById(R.id.iv_animation);
        animImageView.setBackgroundResource(R.drawable.anim_girl);
        animImageView.post(new Runnable() {
            @Override
            public void run() {
                AnimationDrawable frameAnimation = (AnimationDrawable)
                        animImageView.getBackground();
                frameAnimation.start();
            }
        });
        Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent i = new Intent(Splash.this,MainActivity.class);
                startActivity(i);
                finish();
            }
        },3000);
    }
}
