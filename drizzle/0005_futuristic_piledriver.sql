ALTER TABLE `services` ADD `is_active` boolean DEFAULT true NOT NULL;--> statement-breakpoint
ALTER TABLE `services` ADD `created_by` varchar(255);--> statement-breakpoint
ALTER TABLE `services` ADD `updated_by` varchar(255);--> statement-breakpoint
ALTER TABLE `services` ADD `created_at` timestamp DEFAULT (now()) NOT NULL;--> statement-breakpoint
ALTER TABLE `services` ADD `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3) NOT NULL;--> statement-breakpoint
ALTER TABLE `services` ADD `deleted_at` datetime;--> statement-breakpoint
ALTER TABLE `services` ADD `deleted_by` varchar(255);--> statement-breakpoint
ALTER TABLE `services` ADD CONSTRAINT `services_created_by_user_id_fk` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `services` ADD CONSTRAINT `services_updated_by_user_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `services` ADD CONSTRAINT `services_deleted_by_user_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `user`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `services` DROP COLUMN `gallery`;