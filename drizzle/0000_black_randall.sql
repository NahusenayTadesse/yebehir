CREATE TABLE `contact_messages` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(100) NOT NULL,
	`phone` varchar(20),
	`subject` varchar(255) NOT NULL,
	`message` text NOT NULL,
	`address` varchar(255),
	`seen` boolean DEFAULT false,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `contact_messages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `gallery` (
	`id` int AUTO_INCREMENT NOT NULL,
	`image_url` varchar(255),
	CONSTRAINT `gallery_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `portfolio` (
	`id` int AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`slug` varchar(255) NOT NULL,
	`description` text,
	`featuredImage` varchar(255),
	`eventType` varchar(255),
	`date` date,
	`client` varchar(255),
	`location` varchar(255),
	`is_featured_on_home` boolean DEFAULT false,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `portfolio_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `quotes` (
	`id` int AUTO_INCREMENT NOT NULL,
	`service_type` varchar(100) NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(50),
	`event_date` date,
	`event_location` varchar(255),
	`budget_range` varchar(100),
	`guest_count` int,
	`description` text,
	`status` varchar(50) DEFAULT 'pending',
	`created_at` timestamp DEFAULT (now()),
	CONSTRAINT `quotes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `service_gallery` (
	`id` int AUTO_INCREMENT NOT NULL,
	`service_id` int NOT NULL,
	`image_url` varchar(255),
	CONSTRAINT `service_gallery_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `services` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` text,
	CONSTRAINT `services_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `testimonials` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`position` varchar(255),
	`message` text NOT NULL,
	`avatar` varchar(255),
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `testimonials_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `venue_details` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) DEFAULT '4 Kilo Plaza',
	`description` text,
	`capacity` int,
	`booking_policy` text,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `venue_details_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `venue_features` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255),
	`description` text,
	`venue_id` int NOT NULL,
	CONSTRAINT `venue_features_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `venue_images` (
	`id` int AUTO_INCREMENT NOT NULL,
	`venue_id` int NOT NULL,
	`image_url` varchar(255) NOT NULL,
	`is_featured` boolean DEFAULT false,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `venue_images_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `venue_videos` (
	`id` int AUTO_INCREMENT NOT NULL,
	`venue_id` int NOT NULL,
	`video_url` varchar(255) NOT NULL,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `venue_videos_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `account` (
	`id` varchar(36) NOT NULL,
	`account_id` text NOT NULL,
	`provider_id` text NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`access_token` text,
	`refresh_token` text,
	`id_token` text,
	`access_token_expires_at` datetime,
	`refresh_token_expires_at` datetime,
	`scope` text,
	`password` text,
	`created_at` timestamp(3) NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	CONSTRAINT `account_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `permissions` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` varchar(255),
	CONSTRAINT `permissions_id` PRIMARY KEY(`id`),
	CONSTRAINT `permissions_name_unique` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `role_permissions` (
	`id` int AUTO_INCREMENT NOT NULL,
	`role_id` int NOT NULL,
	`permission_id` int NOT NULL,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `role_permissions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `roles` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(32) NOT NULL,
	`description` varchar(255),
	`is_active` boolean NOT NULL DEFAULT true,
	CONSTRAINT `roles_id` PRIMARY KEY(`id`),
	CONSTRAINT `roles_name_unique` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `session` (
	`id` varchar(36) NOT NULL,
	`expires_at` datetime NOT NULL,
	`token` varchar(255) NOT NULL,
	`created_at` timestamp(3) NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`ip_address` text,
	`user_agent` text,
	`user_id` varchar(36) NOT NULL,
	`impersonated_by` text,
	CONSTRAINT `session_id` PRIMARY KEY(`id`),
	CONSTRAINT `session_token_unique` UNIQUE(`token`)
);
--> statement-breakpoint
CREATE TABLE `special_permissions` (
	`id` int AUTO_INCREMENT NOT NULL,
	`user_id` varchar(255) NOT NULL,
	`permission_id` int NOT NULL,
	`is_active` boolean NOT NULL DEFAULT true,
	`created_by` varchar(255),
	`updated_by` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	`deleted_at` datetime,
	`deleted_by` varchar(255),
	CONSTRAINT `special_permissions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` varchar(36) NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`email_verified` boolean NOT NULL DEFAULT false,
	`image` text,
	`role` text,
	`banned` boolean,
	`ban_reason` text,
	`ban_expires` timestamp(3),
	`role_id` int,
	`created_at` timestamp(3) NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	CONSTRAINT `user_id` PRIMARY KEY(`id`),
	CONSTRAINT `user_email_unique` UNIQUE(`email`)
);
--> statement-breakpoint
CREATE TABLE `verification` (
	`id` varchar(36) NOT NULL,
	`identifier` varchar(255) NOT NULL,
	`value` text NOT NULL,
	`expires_at` datetime NOT NULL,
	`created_at` timestamp(3) NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3),
	CONSTRAINT `verification_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `portfolio` ADD CONSTRAINT `portfolio_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio` ADD CONSTRAINT `portfolio_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio` ADD CONSTRAINT `portfolio_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `testimonials` ADD CONSTRAINT `testimonials_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `testimonials` ADD CONSTRAINT `testimonials_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `testimonials` ADD CONSTRAINT `testimonials_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_details` ADD CONSTRAINT `venue_details_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_details` ADD CONSTRAINT `venue_details_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_details` ADD CONSTRAINT `venue_details_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_features` ADD CONSTRAINT `venue_features_venue_id_venue_details_id_fk` FOREIGN KEY (`venue_id`) REFERENCES `venue_details`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_images` ADD CONSTRAINT `venue_images_venue_id_venue_details_id_fk` FOREIGN KEY (`venue_id`) REFERENCES `venue_details`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_images` ADD CONSTRAINT `venue_images_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_images` ADD CONSTRAINT `venue_images_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_images` ADD CONSTRAINT `venue_images_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_videos` ADD CONSTRAINT `venue_videos_venue_id_venue_details_id_fk` FOREIGN KEY (`venue_id`) REFERENCES `venue_details`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_videos` ADD CONSTRAINT `venue_videos_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_videos` ADD CONSTRAINT `venue_videos_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `venue_videos` ADD CONSTRAINT `venue_videos_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `account` ADD CONSTRAINT `account_user_id_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_role_id_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_permission_id_permissions_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_user_id_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `special_permissions` ADD CONSTRAINT `special_permissions_user_id_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `special_permissions` ADD CONSTRAINT `special_permissions_permission_id_permissions_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `special_permissions` ADD CONSTRAINT `special_permissions_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `special_permissions` ADD CONSTRAINT `special_permissions_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `special_permissions` ADD CONSTRAINT `special_permissions_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user` ADD CONSTRAINT `user_role_id_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `account_userId_idx` ON `account` (`user_id`);--> statement-breakpoint
CREATE INDEX `session_userId_idx` ON `session` (`user_id`);--> statement-breakpoint
CREATE INDEX `verification_identifier_idx` ON `verification` (`identifier`);