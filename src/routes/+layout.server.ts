import { db } from '$lib/server/db';
import { portfolio, services } from '$lib/server/db/schema';
import type { LayoutServerLoad } from '../$types';
export const load: LayoutServerLoad = async () => {
	// First, get products
	const portfolioItems = await db.select().from(portfolio);
	// Then, get services
	const servicesItems = await db.select().from(services);

	return {
		portfolioItems,
		servicesItems
	};
};
