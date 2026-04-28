<script lang="ts">
	import { Button } from '$lib/components/ui/button';
	import { SunIcon, MoonIcon } from '@lucide/svelte';
	import PortfolioHero from '$lib/components/portfolio/portfolio-hero.svelte';
	import PortfolioFilters from '$lib/components/portfolio/portfolio-filters.svelte';
	import PortfolioGrid from '$lib/components/portfolio/portfolio-grid.svelte';

	type PortfolioItem = {
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

	// Set app hook

	// Filter state
	let searchQuery = $state('');
	let selectedEventType = $state<string | null>(null);
	let { data } = $props();
	// Filtered items
	const filteredItems = $derived.by(() => {
		let items: PortfolioItem[] = data?.portfolioItems ?? [];

		// Filter by event type
		if (selectedEventType) {
			items = items.filter((item) => item.eventType === selectedEventType);
		}

		// Filter by search query
		if (searchQuery.trim()) {
			const query = searchQuery.toLowerCase().trim();
			items = items.filter(
				(item) =>
					item.title.toLowerCase().includes(query) ||
					item.description?.toLowerCase().includes(query) ||
					item.client?.toLowerCase().includes(query) ||
					item.location?.toLowerCase().includes(query)
			);
		}

		return items;
	});

	const resultsCount = $derived(filteredItems.length);
</script>

<div class="min-h-dvh bg-background text-foreground">
	<!-- Header -->

	<!-- Hero Section -->
	<PortfolioHero />

	<!-- Main Content -->
	<main class="mx-auto mt-10 max-w-7xl px-4 pb-20">
		<!-- Filters -->
		<div class="mb-10">
			<PortfolioFilters
				portfolioItems={data?.portfolioItems}
				bind:searchQuery
				bind:selectedEventType
			/>
		</div>

		<!-- Results count -->
		<div class="mb-6 text-center">
			<p class="text-muted-foreground">
				Showing <span class="font-semibold text-foreground">{resultsCount}</span>
				{resultsCount === 1 ? 'event' : 'events'}
			</p>
		</div>

		<!-- Portfolio Grid -->
		<PortfolioGrid items={filteredItems} />
	</main>
</div>
