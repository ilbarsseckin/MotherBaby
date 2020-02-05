package com.ilbarsseckinapp.mother;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
/**
 * adapter to populate listview with data
 * @author ketan(Visit my <a
 *         href="http://androidsolution4u.blogspot.in/">blog</a>)
 */
public class Options_DisplayAdapter_KasilmaSayar extends BaseAdapter {
    private Context mContext;
    private ArrayList<String> id;
    private ArrayList<String> tarih;
    private ArrayList<String> timer;



    public Options_DisplayAdapter_KasilmaSayar(Context c, ArrayList<String> id, ArrayList<String> date, ArrayList<String> zamanlayıcı)
    {
        this.mContext = c;
        this.id = id;
        this.tarih = date;
        this.timer = zamanlayıcı;


    }

    public int getCount() {
        // TODO Auto-generated method stub
        return id.size();
    }

    public Object getItem(int position) {
        // TODO Auto-generated method stub
        return null;
    }

    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return 0;
    }

    public View getView(int pos, View child, ViewGroup parent) {
        Holder mHolder;
        LayoutInflater layoutInflater;
        if (child == null) {
            layoutInflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            child = layoutInflater.inflate(R.layout.listkasilmacell, null);
            mHolder = new Holder();
            mHolder.txt_id = (TextView) child.findViewById(R.id.txt_id);
            mHolder.txt_tarih = (TextView) child.findViewById(R.id.txt_date);
            mHolder.txt_kasilma = (TextView) child.findViewById(R.id.txt_timer);

            child.setTag(mHolder);
        } else {
            mHolder = (Holder) child.getTag();
        }
        mHolder.txt_id.setText(id.get(pos));
        mHolder.txt_tarih.setText(tarih.get(pos));
        mHolder.txt_kasilma.setText(timer.get(pos));
        return child;
    }

    public class Holder {
        TextView txt_id;
        TextView txt_tarih;
        TextView txt_kasilma;
    }

}
