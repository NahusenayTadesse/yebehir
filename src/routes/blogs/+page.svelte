<script lang="ts">
	import PortfolioHero from '$lib/components/blogs/portfolio-hero.svelte';
	import PortfolioFilters from '$lib/components/blogs/portfolio-filters.svelte';
	import PortfolioGrid from '$lib/components/blogs/portfolio-grid.svelte';
	import type { BlogItem } from '$lib/data/portfolio';

	// Set app hook

	// Filter state
	let searchQuery = $state('');
	let selectedEventType = $state<string | null>(null);
	let { data } = $props();
	// Filtered items
	const filteredItems = $derived.by(() => {
		let items: BlogItem[] = data?.portfolioItems ?? [];

		// Filter by event type
		if (selectedEventType) {
			items = items.filter((item) => item.category === selectedEventType);
		}

		// Filter by search query
		if (searchQuery.trim()) {
			const query = searchQuery.toLowerCase().trim();
			items = items.filter(
				(item) =>
					item.title.toLowerCase().includes(query) ||
					item.excerpt?.toLowerCase().includes(query) ||
					item.category?.toLowerCase().includes(query) ||
					item.content?.toLowerCase().includes(query)
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
				placeholder="Search blogs"
				bind:selectedEventType
			/>
		</div>

		<!-- Results count -->
		<div class="mb-6 text-center">
			<p class="text-muted-foreground">
				Showing <span class="font-semibold text-foreground">{resultsCount}</span>
				{resultsCount === 1 ? 'blog' : 'blogss'}
			</p>
		</div>

		<!-- Portfolio Grid -->
		<PortfolioGrid items={filteredItems} />
	</main>
</div>
