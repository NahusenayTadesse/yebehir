CREATE TABLE `portfolio_gallery` (
	`id` int AUTO_INCREMENT NOT NULL,
	`portfolio_id` int NOT NULL,
	`image_url` varchar(255),
	CONSTRAINT `portfolio_gallery_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `portfolio_gallery` ADD CONSTRAINT `portfolio_gallery_portfolio_id_portfolio_id_fk` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `service_gallery` ADD CONSTRAINT `service_gallery_service_id_services_id_fk` FOREIGN KEY (`service_id`) REFERENCES `services`(`id`) ON DELETE cascade ON UPDATE no action;