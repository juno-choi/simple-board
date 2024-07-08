CREATE TABLE `Member` (
	`member_id`	bigint	NOT NULL,
	`name`	varchar	NULL,
	`email`	varchar	NULL,
	`created_at`	timestamp	NULL,
	`modified_at`	timestamp	NULL
);

CREATE TABLE `Board` (
	`board_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`title`	varchar	NULL,
	`content`	varchar	NULL,
	`view`	bigint	NULL,
	`like`	bigint	NULL,
	`created_at`	timestamp	NULL,
	`modified_at`	timestamp	NULL
);

CREATE TABLE `Comment` (
	`comment_id`	bigint	NOT NULL,
	`board_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`content`	varchar	NULL,
	`like`	bigint	NULL,
	`created_at`	timestamp	NULL,
	`modified_at`	timestamp	NULL
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`member_id`
);

ALTER TABLE `Board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_id`,
	`member_id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`comment_id`,
	`board_id`,
	`member_id`
);

ALTER TABLE `Board` ADD CONSTRAINT `FK_Member_TO_Board_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `Member` (
	`member_id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Board_TO_Comment_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `Board` (
	`board_id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Board_TO_Comment_2` FOREIGN KEY (
	`member_id`
)
REFERENCES `Board` (
	`member_id`
);

