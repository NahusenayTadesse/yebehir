import { db } from '$lib/server/db';
import { portfolio } from '$lib/server/db/schema';
import { eq } from 'drizzle-orm';

import type { PageServerLoad } from '../$types';
export const load: PageServerLoad = async ({ params }) => {
	const { id } = params;
	// First, get products
	const portfolioItems = await db
		.select()
		.from(portfolio)
		.where(eq(portfolio.id, Number(id)))
		.limit(1)
		.then((res) => res[0]);

	return {
		portfolioItems
	};
};
