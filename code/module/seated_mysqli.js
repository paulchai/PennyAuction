module.exports.include_seated = function (mysqli)
{	
mysqli['seated1'] = 'insert into seats_booked  (product_id,user_id,amount,date_added,status) values (?,?,?,?,1)';
mysqli['seated2'] = 'update seats_booked set status = 0 and standDate = ? where status = 1 and user_id = ?  and product_id = ?';
mysqli['seated3'] = 'select p.*,(p.seats-(select count(sb.id) from seats_booked sb where sb.product_id = p.id and status = 1)) as seatsLeft from projects p  where p.date_added >= "{{datge}}" and p.auctionType = "seated"  and p.market_status = "open" order by p.id desc LIMIT 16';
mysqli['seated4'] = 'select id from seats_booked where status = 1 and user_id = ? and product_id = ?';
mysqli['seated5'] = 'select count(id) as seatsBooked from seats_booked where status = 1 and product_id = ?';
mysqli['seated6'] = 'update users set balance = balance-? where id =  ? limit 1';
mysqli['seated7'] = 'update users set balance = balance+? where id =  ? limit 1';
mysqli['seated8'] = 'select p.title,p.seats,p.id,date_format(p.date_added,"%m/%d/%Y %H:%i:%s") as start,date_format(p.date_closed,"%m/%d/%Y %H:%i:%s") as end,p.date_closed,sb.amount,(p.seats-(select count(sb1.id) from seats_booked sb1 where sb1.product_id = p.id and sb1.status = 1)) as seatsLeft from  seats_booked sb inner join projects p on (p.id = sb.product_id)  where p.date_closed >= "{{datge}}" and p.auctionType = "seated"  and p.market_status = "open" and sb.user_id = ? and sb.status = 1 order by p.id desc';

mysqli['seated9'] = 'select p.title,p.id,date_format(p.date_added,"%m/%d/%Y %H:%i:%s") as start,date_format(p.date_closed,"%m/%d/%Y %H:%i:%s") as end,sb.id as seatid,sb.user_id,SUBSTRING(CONCAT(u.first_name," ",upper(LEFT(u.last_name , 1))),1,10) AS name,u.first_name,u.last_name,u.email from seats_booked sb inner join projects p on(sb.product_id = p.id) inner join users  as u on (u.id = sb.user_id) where p.auctionType = "seated" and p.date_added <= "{{datge}}" and p.market_status not in ("sold","closed","removed") and sb.status = 1  and cron = 0 order by p.id desc';


mysqli['seated10'] = 'update seats_booked set cron = 1 where id = ?  and product_id  = ? and user_id = ? and cron = 0';

};