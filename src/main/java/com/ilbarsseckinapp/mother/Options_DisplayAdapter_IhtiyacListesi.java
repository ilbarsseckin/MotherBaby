package com.ilbarsseckinapp.mother;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class Options_DisplayAdapter_IhtiyacListesi extends BaseAdapter {
    private Context mContext;
    private ArrayList<String> ihtiyac;
    private ArrayList<String> status;


    public Options_DisplayAdapter_IhtiyacListesi(Context c, ArrayList<String> ihtiyac, ArrayList<String> durum)
    {
        this.mContext = c;
        this.ihtiyac = ihtiyac;
        this.status = durum;


    }

    public int getCount() {
        // TODO Auto-generated method stub
        return ihtiyac.size();
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
            child = layoutInflater.inflate(R.layout.listcellihtiyac, null);
            mHolder = new Holder();
            mHolder.txt_ihtiyac = (TextView) child.findViewById(R.id.txt_ihtiyac);
            mHolder.txt_status = (TextView) child.findViewById(R.id.txt_status);

            child.setTag(mHolder);
        } else {
            mHolder = (Holder) child.getTag();
        }
        mHolder.txt_ihtiyac.setText(ihtiyac.get(pos));
        mHolder.txt_status.setText(status.get(pos));

        return child;
    }

    public class Holder {
        TextView txt_ihtiyac;
        TextView txt_status;

    }

}
