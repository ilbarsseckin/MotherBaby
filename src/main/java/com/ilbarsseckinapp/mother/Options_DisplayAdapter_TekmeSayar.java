package com.ilbarsseckinapp.mother;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class Options_DisplayAdapter_TekmeSayar extends BaseAdapter {
    private Context mContext;
    private ArrayList<String> id;
    private ArrayList<String> tarih;
    private ArrayList<String> timer;
    private ArrayList<String> kick;


    public Options_DisplayAdapter_TekmeSayar(Context c, ArrayList<String> id, ArrayList<String> date, ArrayList<String> zamanlayıcı, ArrayList<String> tekme)
    {
        this.mContext = c;
        this.id = id;
        this.tarih = date;
        this.timer = zamanlayıcı;
        this.kick = tekme;

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
            child = layoutInflater.inflate(R.layout.listcelltekmesayar, null);
            mHolder = new Holder();
            mHolder.txt_id = (TextView) child.findViewById(R.id.txt_id);
            mHolder.txt_tarih = (TextView) child.findViewById(R.id.txt_date);
            mHolder.txt_kasilma = (TextView) child.findViewById(R.id.txt_timer);
            mHolder.txt_kick = (TextView) child.findViewById(R.id.txt_kicker);
            child.setTag(mHolder);
        } else {
            mHolder = (Holder) child.getTag();
        }
        mHolder.txt_id.setText(id.get(pos));
        mHolder.txt_tarih.setText(tarih.get(pos));
        mHolder.txt_kasilma.setText(timer.get(pos));
        mHolder.txt_kick.setText(kick.get(pos));
        return child;
    }

    public class Holder {
        TextView txt_id;
        TextView txt_tarih;
        TextView txt_kasilma;
        TextView txt_kick;
    }

}
