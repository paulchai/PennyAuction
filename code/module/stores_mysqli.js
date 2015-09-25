module.exports.include_stores = function (mysqli) {

    mysqli['store1'] = 'insert into stores (name,description,avatar,image,`status`,date_added,user_id) values (?,?,?,?,"active",?,?)';
    mysqli['store2'] = 'update stores set  name = ?,description = ?,avatar = ?,image = ?,date_updated = ?    where `id` = ? and user_id and status!="closed" limit 1';
    mysqli['store3'] = 'update stores set  status = "closed",date_closed = ?    where `id` = ? and status!="closed" limit 1';
    mysqli['store4'] = 'insert into stores_categories (cid,storeid) values (?,?)';
    mysqli['store5'] = 'select {{field}} from stores s inner join users u on (u.id = s.user_id) where s.status = "active" {{where}} order by s.id desc {{limit}}';
    mysqli['store6'] = 'update  stores set status = "removed" , date_closed= ? where id = ? and user_id = ?';
    mysqli['store7'] = 'update  stores set name = ?,description=?,avatar = ?,image=?,date_updated = ? where id = ? and user_id = ?';
	mysqli['store8'] = 'delete from stores_categories  where storeid = ?';


};