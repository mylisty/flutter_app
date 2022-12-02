package com.example.flutter_app;

import android.app.Application;

import androidx.multidex.MultiDex;

public class MyApplication  extends Application {
    @Override
    public void onCreate() {
        MultiDex.install(this);
        super.onCreate();
    }
}
