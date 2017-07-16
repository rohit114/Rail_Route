package com.rgraphics.railroot.railroute;


import android.content.Context;
import android.graphics.Bitmap;
import android.support.v4.util.LruCache;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.Volley;

class VolleyHelper {
        private static VolleyHelper mInstance;
        private RequestQueue mRequestQueue;
        private ImageLoader mImageLoader;
        private static Context mCtx;

        private VolleyHelper(Context context) {
            mCtx = context;
            mRequestQueue = getRequestQueue();

            mImageLoader = new ImageLoader(mRequestQueue, new ImageLoader.ImageCache() {
                        private final LruCache<String, Bitmap>
                                cache = new LruCache<>(20);

                        @Override
                        public Bitmap getBitmap(String url) {
                            return cache.get(url);
                        }

                        @Override
                        public void putBitmap(String url, Bitmap bitmap) {
                            cache.put(url, bitmap);
                        }
                    });
        }

        static synchronized VolleyHelper getInstance(Context context) {
            if (mInstance == null) {
                mInstance = new VolleyHelper (context);
            }
            return mInstance;
        }

        private RequestQueue getRequestQueue() {
            if (mRequestQueue == null) {
                mRequestQueue = Volley.newRequestQueue(mCtx.getApplicationContext());
            }
            return mRequestQueue;
        }

        <T> void addToRequestQueue(Request<T> req) {
            getRequestQueue().add(req);
        }

        ImageLoader getImageLoader() {
            return mImageLoader;
        }
     void cancel(final String tag)
     {
        mRequestQueue.cancelAll(tag);
     }
}