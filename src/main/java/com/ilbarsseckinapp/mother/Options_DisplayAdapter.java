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
public class Options_DisplayAdapter extends BaseAdapter {
	private Context mContext;
	private ArrayList<String> id;
	private ArrayList<String> gun;
	private ArrayList<String> degisim;
	private ArrayList<String> kg;
	private ArrayList<String> tarih;
	

	public Options_DisplayAdapter(Context c, ArrayList<String> id, ArrayList<String> gun, ArrayList<String> degisim,
	 ArrayList<String> kg,ArrayList<String> tarih

	) {
		this.mContext = c;
		this.id = id;
		this.gun = gun;
		this.degisim = degisim;
		this.kg = kg;
		this.tarih = tarih;

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
			child = layoutInflater.inflate(R.layout.listcell, null);
			mHolder = new Holder();
			mHolder.txt_id = (TextView) child.findViewById(R.id.txt_id);
			mHolder.txt_gun = (TextView) child.findViewById(R.id.txt_day);
			mHolder.txt_degisim = (TextView) child.findViewById(R.id.txt_change);
			mHolder.txt_kg = (TextView) child.findViewById(R.id.txt_kg);
			mHolder.txt_tarih = (TextView) child.findViewById(R.id.txt_date);
			child.setTag(mHolder);
		} else {
			mHolder = (Holder) child.getTag();
		}
		mHolder.txt_id.setText(id.get(pos));
		mHolder.txt_gun.setText(gun.get(pos));
		mHolder.txt_degisim.setText(degisim.get(pos));
		mHolder.txt_kg.setText(kg.get(pos));
		mHolder.txt_tarih.setText(tarih.get(pos));
		return child;
	}

	public class Holder {
		TextView txt_id;
		TextView txt_gun;
		TextView txt_degisim;
		TextView txt_kg;
		TextView txt_tarih;
	}

}
