import { mysqlTable, int, varchar, boolean, text, timestamp, date } from 'drizzle-orm/mysql-core';
import { secureFields } from './auth.schema';

export const venueDetails = mysqlTable('venue_details', {
	id: int('id').autoincrement().primaryKey(),
	name: varchar('name', { length: 255 }).default('4 Kilo Plaza'),
	description: text('description'),
	capacity: int('capacity'),
	location: varchar('location', { length: 255 }),
	featuredImage: varchar('featuredImage', { length: 255 }),
	bookingPolicy: text('booking_policy'),
	...secureFields
});

export const venueFeatures = mysqlTable('venue_features', {
	id: int('id').autoincrement().primaryKey(),
	name: varchar('name', { length: 255 }),
	description: text('description'),
	venueId: int('venue_id')
		.notNull()
		.references(() => venueDetails.id, { onDelete: 'cascade' })
});

export const venueImages = mysqlTable('venue_images', {
	id: int('id').autoincrement().primaryKey(),
	venueId: int('venue_id')
		.notNull()
		.references(() => venueDetails.id, { onDelete: 'cascade' }),
	imageUrl: varchar('image_url', { length: 255 }).notNull(),
	isFeatured: boolean('is_featured').default(false),
	...secureFields
});

export const venueVideos = mysqlTable('venue_videos', {
	id: int('id').autoincrement().primaryKey(),
	venueId: int('venue_id')
		.notNull()
		.references(() => venueDetails.id, { onDelete: 'cascade' }),
	videoUrl: varchar('video_url', { length: 255 }).notNull(),
	...secureFields
});

export const venueBooking = mysqlTable('venue_booking', {
	id: int('id').primaryKey().autoincrement(),
	venueId: int('venue_id')
		.notNull()
		.references(() => venueDetails.id, { onDelete: 'cascade' }),
	guestCount: int('guest_count'),
	description: text('description'),
	status: varchar('status', { length: 50 }).default('pending'),
	createdAt: timestamp('created_at').defaultNow()
});

export const services = mysqlTable('services', {
	id: int('id').primaryKey().autoincrement(),
	name: varchar('name', { length: 255 }).notNull(),
	description: text('description'),
	longDescription: text('long_description'),
	featuredImage: varchar('featured_image', { length: 255 }),
	...secureFields
});

export const serviceGallery = mysqlTable('service_gallery', {
	id: int('id').primaryKey().autoincrement(),
	serviceId: int('service_id')
		.notNull()
		.references(() => services.id, { onDelete: 'cascade' }),
	imageUrl: varchar('image_url', { length: 255 })
});

export const quotes = mysqlTable('quotes', {
	id: int('id').autoincrement().primaryKey(),
	serviceType: varchar('service_type', { length: 100 }).notNull(),
	name: varchar('name', { length: 255 }).notNull(),
	email: varchar('email', { length: 255 }).notNull(),
	phone: varchar('phone', { length: 50 }),
	eventDate: date('event_date'),
	eventLocation: varchar('event_location', { length: 255 }),
	budgetRange: varchar('budget_range', { length: 100 }),
	guestCount: int('guest_count'),
	description: text('description'),
	status: varchar('status', { length: 50 }).default('pending'),
	createdAt: timestamp('created_at').defaultNow()
});

export const blogCategories = mysqlTable('blog_categories', {
	id: int('id').primaryKey().autoincrement(),
	name: varchar('name', { length: 255 }).notNull(),
	description: varchar('description', { length: 255 }).notNull()
});

export const blog = mysqlTable('blog', {
	id: int('id').primaryKey().autoincrement(),
	title: varchar('title', { length: 255 }).notNull(),
	categoryId: int('category_id')
		.notNull()
		.references(() => blogCategories.id, { onDelete: 'cascade' }),
	slug: varchar('slug', { length: 255 }).notNull(),
	excerpt: text('excerpt'),
	content: text('content'),
	isFeaturedOnHome: boolean('is_featured_on_home').default(false),
	featuredImage: varchar('featured_image', { length: 255 }),
	...secureFields
});

export const blogGallery = mysqlTable('blog_gallery', {
	id: int('id').primaryKey().autoincrement(),
	blogId: int('blog_id')
		.notNull()
		.references(() => blog.id, { onDelete: 'cascade' }),
	imageUrl: varchar('image_url', { length: 255 })
});

export const portfolio = mysqlTable('portfolio', {
	id: int('id').primaryKey().autoincrement(),
	title: varchar('title', { length: 255 }).notNull(),
	slug: varchar('slug', { length: 255 }).notNull(),
	description: text('description'),
	featuredImage: varchar('featuredImage', { length: 255 }),
	eventType: varchar('eventType', { length: 255 }),
	date: date('date'),
	client: varchar('client', { length: 255 }),
	location: varchar('location', { length: 255 }),
	isFeaturedOnHome: boolean('is_featured_on_home').default(false),
	...secureFields
});

export const portfolioGallery = mysqlTable('portfolio_gallery', {
	id: int('id').primaryKey().autoincrement(),
	portfolioId: int('portfolio_id')
		.notNull()
		.references(() => portfolio.id, { onDelete: 'cascade' }),
	imageUrl: varchar('image_url', { length: 255 })
});

export const contactMessages = mysqlTable('contact_messages', {
	id: int('id').primaryKey().autoincrement(),
	name: varchar('name', { length: 255 }).notNull(),
	email: varchar('email', { length: 100 }).notNull(),
	phone: varchar('phone', { length: 20 }),
	subject: varchar('subject', { length: 255 }).notNull(),
	message: text('message').notNull(),
	address: varchar('address', { length: 255 }),
	seen: boolean('seen').default(false),
	createdAt: timestamp('created_at').defaultNow().notNull()
});

export const testimonials = mysqlTable('testimonials', {
	id: int('id').primaryKey().autoincrement(),
	name: varchar('name', { length: 255 }).notNull(),
	position: varchar('position', { length: 255 }),
	message: text('message').notNull(),
	avatar: varchar('avatar', { length: 255 }),
	...secureFields
});

export const gallery = mysqlTable('gallery', {
	id: int('id').primaryKey().autoincrement(),
	imageUrl: varchar('image_url', { length: 255 })
});

export * from './auth.schema';
