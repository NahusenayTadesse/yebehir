CREATE TABLE `account` (
	`id` text(36) PRIMARY KEY NOT NULL,
	`account_id` text NOT NULL,
	`provider_id` text NOT NULL,
	`user_id` text(36) NOT NULL,
	`access_token` text DEFAULT 'sql`(NULL)`',
	`refresh_token` text DEFAULT 'sql`(NULL)`',
	`id_token` text DEFAULT 'sql`(NULL)`',
	`access_token_expires_at` text DEFAULT 'sql`(NULL)`',
	`refresh_token_expires_at` text DEFAULT 'sql`(NULL)`',
	`scope` text DEFAULT 'sql`(NULL)`',
	`password` text DEFAULT 'sql`(NULL)`',
	`created_at` text(3) DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `blog` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`title` text(255) NOT NULL,
	`category_id` integer NOT NULL,
	`slug` text(255) NOT NULL,
	`excerpt` text DEFAULT 'sql`(NULL)`',
	`content` text DEFAULT 'sql`(NULL)`',
	`is_featured_on_home` integer DEFAULT 0,
	`featured_image` text(255) DEFAULT 'sql`(NULL)`',
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `blog_categories` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) NOT NULL,
	`description` text(255) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `blog_gallery` (
	`id` integer PRIMARY KEY NOT NULL,
	`blog_id` integer NOT NULL,
	`image_url` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `contact_messages` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) NOT NULL,
	`email` text(100) NOT NULL,
	`phone` text(20) DEFAULT 'sql`(NULL)`',
	`subject` text(255) NOT NULL,
	`message` text NOT NULL,
	`address` text(255) DEFAULT 'sql`(NULL)`',
	`seen` integer DEFAULT 0,
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `gallery` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`image_url` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `permissions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(50) NOT NULL,
	`description` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `portfolio` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`title` text(255) NOT NULL,
	`slug` text(255) NOT NULL,
	`description` text DEFAULT 'sql`(NULL)`',
	`featuredImage` text(255) DEFAULT 'sql`(NULL)`',
	`eventType` text(255) DEFAULT 'sql`(NULL)`',
	`date` text DEFAULT 'sql`(NULL)`',
	`client` text(255) DEFAULT 'sql`(NULL)`',
	`location` text(255) DEFAULT 'sql`(NULL)`',
	`is_featured_on_home` integer DEFAULT 0,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `portfolio_gallery` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`portfolio_id` integer NOT NULL,
	`image_url` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `quotes` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`service_type` text(100) NOT NULL,
	`name` text(255) NOT NULL,
	`email` text(255) NOT NULL,
	`phone` text(50) DEFAULT 'sql`(NULL)`',
	`event_date` text DEFAULT 'sql`(NULL)`',
	`event_location` text(255) DEFAULT 'sql`(NULL)`',
	`budget_range` text(100) DEFAULT 'sql`(NULL)`',
	`guest_count` integer DEFAULT (NULL),
	`description` text DEFAULT 'sql`(NULL)`',
	`status` text(50) DEFAULT 'pending',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `role_permissions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`role_id` integer NOT NULL,
	`permission_id` integer NOT NULL,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `roles` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(32) NOT NULL,
	`description` text(255) DEFAULT 'sql`(NULL)`',
	`is_active` integer DEFAULT 1 NOT NULL
);
--> statement-breakpoint
CREATE TABLE `service_gallery` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`service_id` integer NOT NULL,
	`image_url` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `services` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) NOT NULL,
	`description` text DEFAULT 'sql`(NULL)`',
	`long_description` text DEFAULT 'sql`(NULL)`',
	`featured_image` text(255) DEFAULT 'sql`(NULL)`',
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `session` (
	`id` text(36) PRIMARY KEY NOT NULL,
	`expires_at` text NOT NULL,
	`token` text(255) NOT NULL,
	`created_at` text(3) DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`ip_address` text DEFAULT 'sql`(NULL)`',
	`user_agent` text DEFAULT 'sql`(NULL)`',
	`user_id` text(36) NOT NULL,
	`impersonated_by` text DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `special_permissions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` text(255) NOT NULL,
	`permission_id` integer NOT NULL,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `testimonials` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) NOT NULL,
	`position` text(255) DEFAULT 'sql`(NULL)`',
	`message` text NOT NULL,
	`avatar` text(255) DEFAULT 'sql`(NULL)`',
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` text(36) PRIMARY KEY NOT NULL,
	`name` text(255) NOT NULL,
	`email` text(255) NOT NULL,
	`email_verified` integer DEFAULT 0 NOT NULL,
	`image` text DEFAULT 'sql`(NULL)`',
	`role` text DEFAULT 'sql`(NULL)`',
	`banned` integer DEFAULT (NULL),
	`ban_reason` text DEFAULT 'sql`(NULL)`',
	`ban_expires` text(3) DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`role_id` integer DEFAULT (NULL),
	`created_at` text(3) DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `venue_booking` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`venue_id` integer NOT NULL,
	`guest_count` integer DEFAULT (NULL),
	`description` text DEFAULT 'sql`(NULL)`',
	`status` text(50) DEFAULT 'pending',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `venue_details` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) DEFAULT '4 Kilo Plaza',
	`description` text DEFAULT 'sql`(NULL)`',
	`capacity` integer DEFAULT (NULL),
	`booking_policy` text DEFAULT 'sql`(NULL)`',
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`',
	`featuredImage` text(255) DEFAULT 'sql`(NULL)`',
	`location` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `venue_features` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(255) DEFAULT 'sql`(NULL)`',
	`description` text DEFAULT 'sql`(NULL)`',
	`venue_id` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `venue_images` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`venue_id` integer NOT NULL,
	`image_url` text(255) NOT NULL,
	`is_featured` integer DEFAULT 0,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `venue_videos` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`venue_id` integer NOT NULL,
	`video_url` text(255) NOT NULL,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_by` text(255) DEFAULT 'sql`(NULL)`',
	`updated_by` text(255) DEFAULT 'sql`(NULL)`',
	`created_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`deleted_at` text DEFAULT 'sql`(NULL)`',
	`deleted_by` text(255) DEFAULT 'sql`(NULL)`'
);
--> statement-breakpoint
CREATE TABLE `verification` (
	`id` text(36) PRIMARY KEY NOT NULL,
	`identifier` text(255) NOT NULL,
	`value` text NOT NULL,
	`expires_at` text NOT NULL,
	`created_at` text(3) DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL,
	`updated_at` text DEFAULT 'sql`(CURRENT_TIMESTAMP)`' NOT NULL
);
