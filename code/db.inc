ALTER TABLE  `projects` ADD  `bprice` FLOAT( 10, 2 ) NOT NULL;
ALTER TABLE  `projects` ADD  `mprice` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00',
ADD  `iprice` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';
ALTER TABLE  `projects` ADD  `wprice` FLOAT( 10, 2 ) NOT NULL;
ALTER TABLE  `bids` CHANGE  `proposed_amount`  `proposed_amount` FLOAT( 10, 2 ) NULL DEFAULT  '0.00';
ALTER TABLE  `users` ADD  `balance` INT( 100 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `users` ADD  `customerid` VARCHAR( 100 ) NOT NULL ,
ADD  `paymentid` VARCHAR( 100 ) NOT NULL;


ALTER TABLE  `projects` ADD  `market_status` ENUM(  'open',  'closed',  'sold',  'draft' ) NOT NULL DEFAULT  'open';


ALTER TABLE  `invoices` ADD  `status` ENUM(  'paid',  'unpaid' ) NOT NULL DEFAULT  'unpaid';
ALTER TABLE  `invoices` ADD  `istatus` ENUM(  'debit',  'credit' ) NOT NULL DEFAULT  'debit';
ALTER TABLE  `users` ADD  `balance_amount` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00',
ADD  `reserve_amount` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';

ALTER TABLE  `users` CHANGE  `balance`  `balance` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';
ALTER TABLE  `bids` ADD  `reserved` INT( 1 ) NOT NULL DEFAULT  '0',
ADD  `reserved_date` DATETIME NOT NULL;

ALTER TABLE  `projects` CHANGE  `market_status`  `market_status` ENUM(  'open',  'closed',  'sold',  'draft',  'removed' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  'open'

ALTER TABLE `users` ADD `aboutme` TEXT NOT NULL , ADD `image` VARCHAR(255) NOT NULL , ADD `avatar` VARCHAR(255) NOT NULL ;
ALTER TABLE `users` ADD `status` ENUM(  'active',  'unsubscribe', 'moderate','unverified','deactivate' ) NOT NULL DEFAULT  'active'  ;

ALTER TABLE  `users` ADD  `admin` INT( 1 ) NOT NULL DEFAULT  '0';
CREATE TABLE IF NOT EXISTS `projects_autobid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_amount` double NOT NULL,
  `amount` double NOT NULL,
  `bids` int(11) NOT NULL,
  `balance` double NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `buynow` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `project_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `amount` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `source` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
)


ALTER TABLE  `users` ADD  `fb_id` VARCHAR( 100 ) NOT NULL ,
ADD  `tw_id` VARCHAR( 100 ) NOT NULL ,
ADD  `fb_json` VARCHAR( 100 ) NOT NULL ,
ADD  `tw_json` VARCHAR( 100 ) NOT NULL;
ALTER TABLE  `users` CHANGE  `fb_json`  `fb_json` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `users` CHANGE  `tw_json`  `fb_json` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `projects_autobid` ADD `status` VARCHAR(100) NOT NULL ;


CREATE TABLE IF NOT EXISTS `pmb` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `from_id` int(100) NOT NULL,
  `to_id` int(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date_sent` datetime NOT NULL,
  `read` int(1) NOT NULL,
  `from_status` enum('delete','archive','open') NOT NULL DEFAULT 'open',
  `to_status` enum('delete','archive','open') NOT NULL DEFAULT 'open',
  `date_read` datetime NOT NULL,
  `r_id` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;



CREATE TABLE IF NOT EXISTS `profile_categories` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


ALTER TABLE `reviews` CHANGE `rating` `rating` FLOAT NOT NULL;
ALTER TABLE `reviews` ADD `dispute` INT(1) NOT NULL DEFAULT '0' ;

CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` float(10,2) NOT NULL,
  `date_added` datetime NOT NULL,
  `method` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `user_id` int(100) NOT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  `paid_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `name`, `description`) VALUES
(1, 'Product Buyer', 'mysqli[188] = ''select * from  membership_permission'';mysqli[188] = ''select * from  membership_permission'';mysqli[188] = ''select * from  membership_permission'';mysqli[188] = ''select * from  membership_permission'';'),
(2, 'Product Owner', 'asdasd 2'),
(3, 'Product Bidder & Owner', 'Product Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & OwnerProduct Bidder & Owner'),
(4, 'sad', 'asd'),
(5, 'asd', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `membership_permission`
--

CREATE TABLE IF NOT EXISTS `membership_permission` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `membership_permission`
--

INSERT INTO `membership_permission` (`id`, `name`, `description`) VALUES
(1, 'sad', 'sadsdd');

-- --------------------------------------------------------

--
-- Table structure for table `membership_permission_default`
--

CREATE TABLE IF NOT EXISTS `membership_permission_default` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `permission_id` int(100) NOT NULL,
  `varname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `membership_permission_default`
--

INSERT INTO `membership_permission_default` (`id`, `permission_id`, `varname`, `name`, `description`, `type`, `value`) VALUES
(1, 0, 'allow_to_bid', 'Allow to bid', 'Enabling this members can do bidding on this permission assigned', 'radio', '1'),
(2, 0, 'allow_to_post', 'Allow to post product', 'By enabling this user can post a product', 'radio', '1'),
(3, 0, 'allow_to_bid', 'Allow to bid', 'Enabling this members can do bidding on this permission assigned', 'radio', '1'),
(4, 0, 'allow_to_post', 'Allow to post product', 'By enabling this user can post a product', 'radio', '1'),
(5, 0, 'bid_limit', 'Bid Limit', 'Please enter the maximum bid entered by user', 'int', '100'),
(6, 0, 'monthly_bid_limit', 'Monthly Bid Limit', 'Please enter the  monthly maximum bid entered by user', 'int', '10'),
(7, 0, 'project_limit', 'Project Limit', 'Please enter the maximum project posted by user', 'int', '100'),
(8, 0, 'monthly_project_limit', 'Monthly Project Limit', 'Please enter the  monthly maximum Project posted by user', 'int', '10');

-- --------------------------------------------------------

--
-- Table structure for table `membership_permission_detail`
--

CREATE TABLE IF NOT EXISTS `membership_permission_detail` (
  `id` int(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `permission_id` int(100) NOT NULL,
  `plan_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `membership_plan`
--

CREATE TABLE IF NOT EXISTS `membership_plan` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `membership_id` int(100) NOT NULL,
  `length` int(100) NOT NULL,
  `format` enum('D','M','Y') NOT NULL,
  `amount` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `name` varchar(100) NOT NULL,
  `permission_id` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `membership_plan`
--

INSERT INTO `membership_plan` (`id`, `membership_id`, `length`, `format`, `amount`, `description`, `name`, `permission_id`) VALUES
(1, 1, 20, 'M', 10.00, 'sadasd', 'Product Buyer', 0);

ALTER TABLE `buynow` ADD `couponcode` VARCHAR(20) NOT NULL , ADD `discount` FLOAT NOT NULL , ADD `paid` FLOAT NOT NULL ;


CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `code` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;



CREATE TABLE IF NOT EXISTS `product_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `buyer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


ALTER TABLE `buynow` ADD `bidcredits` FLOAT NOT NULL ;


update `users` set `paymentid`= 0 ,`customerid` = 0,`acustomerid`=0,`apaymentid`=0

ALTER TABLE `users` ADD `acustomerid` VARCHAR(100) NOT NULL AFTER `li_json`, ADD `apaymentid` VARCHAR(100) NOT NULL AFTER `acustomerid`;