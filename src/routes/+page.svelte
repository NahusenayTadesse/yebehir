<script>
	import Hero from '$lib/components/hero.svelte';
	import About from '$lib/components/about.svelte';
	import Faq from '$lib/components/faq.svelte';
	import ServiceGrid from '$lib/components/services/service-grid.svelte';
	import * as Carousel from '$lib/components/ui/carousel/index.js';
	import PortfolioCard from '$lib/components/portfolio/portfolio-card.svelte';

	let { data } = $props();
</script>

<svelte:head>
	<title>Yebehir Ventures</title>
</svelte:head>

<Hero />
<About />
{#if data?.portfolioItems.length}
	<section class="w-full space-y-8 py-12">
		<!-- Section Header -->
		<div class="flex flex-col items-center space-y-2 text-center">
			<h2 class="text-3xl font-bold tracking-tight text-foreground">Featured Events</h2>
			<p class="max-w-150 text-muted-foreground">
				A curated look at our most recent celebrations, corporate gatherings, and milestones.
			</p>
		</div>

		<!-- Carousel Container -->
		<div class="relative px-12">
			<Carousel.Root opts={{ align: 'start', loop: true }} class="w-full">
				<Carousel.Content class="-ml-4">
					{#each data.portfolioItems as item (item.id)}
						<Carousel.Item class="basis-full pl-4 md:basis-1/2 lg:basis-1/3">
							<div class="h-full transition-all hover:scale-[1.01]">
								<PortfolioCard {item} />
							</div>
						</Carousel.Item>
					{/each}
				</Carousel.Content>

				<!-- Styled Navigation -->
				<Carousel.Previous
					class="hidden border-input bg-background text-foreground hover:bg-accent hover:text-accent-foreground md:flex"
				/>
				<Carousel.Next
					class="hidden border-input bg-background text-foreground hover:bg-accent hover:text-accent-foreground md:flex"
				/>
			</Carousel.Root>
		</div>
	</section>
{/if}

{#if data?.servicesItems.length}
	<ServiceGrid services={data.servicesItems} />
	<br />
{/if}
<Faq />
