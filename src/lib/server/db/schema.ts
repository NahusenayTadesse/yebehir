import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core';
import { sql } from 'drizzle-orm';

export const account = sqliteTable('account', {
	id: text({ length: 36 }).primaryKey(),
	accountId: text('account_id').notNull(),
	providerId: text('provider_id').notNull(),
	userId: text('user_id', { length: 36 }).notNull(),
	accessToken: text('access_token').default('sql`(NULL)`'),
	refreshToken: text('refresh_token').default('sql`(NULL)`'),
	idToken: text('id_token').default('sql`(NULL)`'),
	accessTokenExpiresAt: text('access_token_expires_at').default('sql`(NULL)`'),
	refreshTokenExpiresAt: text('refresh_token_expires_at').default('sql`(NULL)`'),
	scope: text().default('sql`(NULL)`'),
	password: text().default('sql`(NULL)`'),
	createdAt: text('created_at', { length: 3 }).default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});

export const blog = sqliteTable('blog', {
	id: integer().primaryKey({ autoIncrement: true }),
	title: text({ length: 255 }).notNull(),
	categoryId: integer('category_id').notNull(),
	slug: text({ length: 255 }).notNull(),
	excerpt: text().default('sql`(NULL)`'),
	content: text().default('sql`(NULL)`'),
	isFeaturedOnHome: integer('is_featured_on_home').default(0),
	featuredImage: text('featured_image', { length: 255 }).default('sql`(NULL)`'),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const blogCategories = sqliteTable('blog_categories', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).notNull(),
	description: text({ length: 255 }).notNull()
});

export const blogGallery = sqliteTable('blog_gallery', {
	id: integer().primaryKey({ autoIncrement: true }),
	blogId: integer('blog_id').notNull(),
	imageUrl: text('image_url', { length: 255 }).default('sql`(NULL)`')
});

export const contactMessages = sqliteTable('contact_messages', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).notNull(),
	email: text({ length: 100 }).notNull(),
	phone: text({ length: 20 }).default('sql`(NULL)`'),
	subject: text({ length: 255 }).notNull(),
	message: text().notNull(),
	address: text({ length: 255 }).default('sql`(NULL)`'),
	seen: integer().default(0),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});

export const gallery = sqliteTable('gallery', {
	id: integer().primaryKey({ autoIncrement: true }),
	imageUrl: text('image_url', { length: 255 }).default('sql`(NULL)`')
});

export const permissions = sqliteTable('permissions', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 50 }).notNull(),
	description: text({ length: 255 }).default('sql`(NULL)`')
});

export const portfolio = sqliteTable('portfolio', {
	id: integer().primaryKey({ autoIncrement: true }),
	title: text({ length: 255 }).notNull(),
	slug: text({ length: 255 }).notNull(),
	description: text().default('sql`(NULL)`'),
	featuredImage: text({ length: 255 }).default('sql`(NULL)`'),
	eventType: text({ length: 255 }).default('sql`(NULL)`'),
	date: text().default('sql`(NULL)`'),
	client: text({ length: 255 }).default('sql`(NULL)`'),
	location: text({ length: 255 }).default('sql`(NULL)`'),
	isFeaturedOnHome: integer('is_featured_on_home').default(0),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const portfolioGallery = sqliteTable('portfolio_gallery', {
	id: integer().primaryKey({ autoIncrement: true }),
	portfolioId: integer('portfolio_id').notNull(),
	imageUrl: text('image_url', { length: 255 }).default('sql`(NULL)`')
});

export const quotes = sqliteTable('quotes', {
	id: integer().primaryKey({ autoIncrement: true }),
	serviceType: text('service_type', { length: 100 }).notNull(),
	name: text({ length: 255 }).notNull(),
	email: text({ length: 255 }).notNull(),
	phone: text({ length: 50 }).default('sql`(NULL)`'),
	eventDate: text('event_date').default('sql`(NULL)`'),
	eventLocation: text('event_location', { length: 255 }).default('sql`(NULL)`'),
	budgetRange: text('budget_range', { length: 100 }).default('sql`(NULL)`'),
	guestCount: integer('guest_count').default(sql`(NULL)`),
	description: text().default('sql`(NULL)`'),
	status: text({ length: 50 }).default('pending'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});

export const roles = sqliteTable('roles', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 32 }).notNull(),
	description: text({ length: 255 }).default('sql`(NULL)`'),
	isActive: integer('is_active').default(1).notNull()
});

export const rolePermissions = sqliteTable('role_permissions', {
	id: integer().primaryKey({ autoIncrement: true }),
	roleId: integer('role_id').notNull(),
	permissionId: integer('permission_id').notNull(),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const services = sqliteTable('services', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).notNull(),
	description: text().default('sql`(NULL)`'),
	longDescription: text('long_description').default('sql`(NULL)`'),
	featuredImage: text('featured_image', { length: 255 }).default('sql`(NULL)`'),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const serviceGallery = sqliteTable('service_gallery', {
	id: integer().primaryKey({ autoIncrement: true }),
	serviceId: integer('service_id').notNull(),
	imageUrl: text('image_url', { length: 255 }).default('sql`(NULL)`')
});

export const session = sqliteTable('session', {
	id: text({ length: 36 }).primaryKey(),
	expiresAt: text('expires_at').notNull(),
	token: text({ length: 255 }).notNull(),
	createdAt: text('created_at', { length: 3 }).default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	ipAddress: text('ip_address').default('sql`(NULL)`'),
	userAgent: text('user_agent').default('sql`(NULL)`'),
	userId: text('user_id', { length: 36 }).notNull(),
	impersonatedBy: text('impersonated_by').default('sql`(NULL)`')
});

export const specialPermissions = sqliteTable('special_permissions', {
	id: integer().primaryKey({ autoIncrement: true }),
	userId: text('user_id', { length: 255 }).notNull(),
	permissionId: integer('permission_id').notNull(),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const testimonials = sqliteTable('testimonials', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).notNull(),
	position: text({ length: 255 }).default('sql`(NULL)`'),
	message: text().notNull(),
	avatar: text({ length: 255 }).default('sql`(NULL)`'),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const user = sqliteTable('user', {
	id: text({ length: 36 }).primaryKey(),
	name: text({ length: 255 }).notNull(),
	email: text({ length: 255 }).notNull(),
	emailVerified: integer('email_verified').default(0).notNull(),
	image: text().default('sql`(NULL)`'),
	role: text().default('sql`(NULL)`'),
	banned: integer().default(sql`(NULL)`),
	banReason: text('ban_reason').default('sql`(NULL)`'),
	banExpires: text('ban_expires', { length: 3 }).default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	roleId: integer('role_id').default(sql`(NULL)`),
	createdAt: text('created_at', { length: 3 }).default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});

export const venueBooking = sqliteTable('venue_booking', {
	id: integer().primaryKey({ autoIncrement: true }),
	venueId: integer('venue_id').notNull(),
	guestCount: integer('guest_count').default(sql`(NULL)`),
	description: text().default('sql`(NULL)`'),
	status: text({ length: 50 }).default('pending'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});

export const venueDetails = sqliteTable('venue_details', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).default('4 Kilo Plaza'),
	description: text().default('sql`(NULL)`'),
	capacity: integer().default(sql`(NULL)`),
	bookingPolicy: text('booking_policy').default('sql`(NULL)`'),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`'),
	featuredImage: text({ length: 255 }).default('sql`(NULL)`'),
	location: text({ length: 255 }).default('sql`(NULL)`')
});

export const venueFeatures = sqliteTable('venue_features', {
	id: integer().primaryKey({ autoIncrement: true }),
	name: text({ length: 255 }).default('sql`(NULL)`'),
	description: text().default('sql`(NULL)`'),
	venueId: integer('venue_id').notNull()
});

export const venueImages = sqliteTable('venue_images', {
	id: integer().primaryKey({ autoIncrement: true }),
	venueId: integer('venue_id').notNull(),
	imageUrl: text('image_url', { length: 255 }).notNull(),
	isFeatured: integer('is_featured').default(0),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const venueVideos = sqliteTable('venue_videos', {
	id: integer().primaryKey({ autoIncrement: true }),
	venueId: integer('venue_id').notNull(),
	videoUrl: text('video_url', { length: 255 }).notNull(),
	isActive: integer('is_active').default(1).notNull(),
	createdBy: text('created_by', { length: 255 }).default('sql`(NULL)`'),
	updatedBy: text('updated_by', { length: 255 }).default('sql`(NULL)`'),
	createdAt: text('created_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	deletedAt: text('deleted_at').default('sql`(NULL)`'),
	deletedBy: text('deleted_by', { length: 255 }).default('sql`(NULL)`')
});

export const verification = sqliteTable('verification', {
	id: text({ length: 36 }).primaryKey(),
	identifier: text({ length: 255 }).notNull(),
	value: text().notNull(),
	expiresAt: text('expires_at').notNull(),
	createdAt: text('created_at', { length: 3 }).default('sql`(CURRENT_TIMESTAMP)`').notNull(),
	updatedAt: text('updated_at').default('sql`(CURRENT_TIMESTAMP)`').notNull()
});
