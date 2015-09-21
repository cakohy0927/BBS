package com.cako.conn;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;

public class MongodConnection {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		Mongo mongo = new Mongo();
		// 查询所有的Database
		for (String name : mongo.getDatabaseNames()) {
			System.out.println("dbName: " + name);
		}

		DB db = mongo.getDB("test");
		// 查询所有的聚集集合
		for (String name : db.getCollectionNames()) {
			System.out.println("collectionName: " + name);
		}

		DBCollection collection = db.getCollection("person");
		DBCursor cur = collection.find();
		while (cur.hasNext()) {
			System.out.println(cur.next());
		}
		System.out.println(cur.count());
		System.out.println(cur.getCursorId());
		System.out.println(JSON.serialize(cur));
	}
}
