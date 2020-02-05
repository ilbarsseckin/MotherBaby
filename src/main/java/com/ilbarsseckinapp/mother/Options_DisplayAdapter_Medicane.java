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
public class Options_DisplayAdapter_Medicane extends BaseAdapter {
    private Context mContext;
    private ArrayList<String> id;
    private ArrayList<String> name;
    private ArrayList<String> time;
    private ArrayList<String> actok;
    private ArrayList<String> durum;


    public Options_DisplayAdapter_Medicane(Context c, ArrayList<String> id, ArrayList<String> gun, ArrayList<String> degisim,
                                  ArrayList<String> kg,ArrayList<String> tarih

    ) {
        this.mContext = c;
        this.id = id;
        this.name = gun;
        this.time = degisim;
        this.actok = kg;
        this.durum = tarih;

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
            child = layoutInflater.inflate(R.layout.listcell_medicane, null);
            mHolder = new Holder();
            mHolder.txt_id = (TextView) child.findViewById(R.id.txt_id);
            mHolder.txt_name = (TextView) child.findViewById(R.id.txt_name);
            mHolder.txt_time = (TextView) child.findViewById(R.id.txt_time);
            mHolder.txt_actok = (TextView) child.findViewById(R.id.txt_actok);
            mHolder.txt_durum = (TextView) child.findViewById(R.id.txt_durum);
            child.setTag(mHolder);
        } else {
            mHolder = (Holder) child.getTag();
        }
        mHolder.txt_id.setText(id.get(pos));
        mHolder.txt_name.setText(name.get(pos));
        mHolder.txt_time.setText(time.get(pos));
        mHolder.txt_actok.setText(actok.get(pos));
        mHolder.txt_durum.setText(durum.get(pos));
        return child;
    }

    public class Holder {
        TextView txt_id;
        TextView txt_name;
        TextView txt_time;
        TextView txt_actok;
        TextView txt_durum;
    }

}
