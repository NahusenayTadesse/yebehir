export type PortfolioItem = {
	id: number;
	title: string;
	slug: string;
	description: string | null;
	featuredImage: string | null;
	eventType: string | null;
	date: string | null;
	client: string | null;
	location: string | null;
};

export const eventTypes = [
	...new Set(portfolioItems.map((item) => item.eventType).filter(Boolean))
] as string[];
