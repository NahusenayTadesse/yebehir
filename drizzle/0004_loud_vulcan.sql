CREATE TABLE `venue_booking` (
	`id` int AUTO_INCREMENT NOT NULL,
	`venue_id` int NOT NULL,
	`guest_count` int,
	`description` text,
	`status` varchar(50) DEFAULT 'pending',
	`created_at` timestamp DEFAULT (now()),
	CONSTRAINT `venue_booking_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `services` ADD `long_description` text;--> statement-breakpoint
ALTER TABLE `services` ADD `featured_image` varchar(255);--> statement-breakpoint
ALTER TABLE `services` ADD `gallery` text;--> statement-breakpoint
ALTER TABLE `venue_booking` ADD CONSTRAINT `venue_booking_venue_id_venue_details_id_fk` FOREIGN KEY (`venue_id`) REFERENCES `venue_details`(`id`) ON DELETE cascade ON UPDATE no action;