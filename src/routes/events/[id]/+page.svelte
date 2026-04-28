<script lang="ts">
	import { fade, fly } from 'svelte/transition';
	import { Button } from '$lib/components/ui/button';
	import { Badge } from '$lib/components/ui/badge';
	import { Separator } from '$lib/components/ui/separator';
	import { ArrowLeftIcon, CalendarIcon, MapPinIcon, UserIcon, SparklesIcon } from '@lucide/svelte';
	import type { PortfolioItem } from '$lib/data/portfolio';

	// const {
	// 	item,
	// 	onBack
	// }: {
	// 	item: PortfolioItem;
	// 	onBack: () => void;
	// } = $props();
	//

	const { data } = $props();

	const item: PortfolioItem = $derived(data?.portfolioItems);

	const formattedDate = $derived(
		item.date
			? new Date(item.date).toLocaleDateString('en-US', {
					weekday: 'long',
					month: 'long',
					day: 'numeric',
					year: 'numeric'
				})
			: null
	);
</script>

<div class="min-h-dvh" in:fade={{ duration: 300 }}>
	<!-- Hero Image Section -->
	<div class="relative h-[50vh] overflow-hidden lg:h-[60vh]">
		<img
			src={item.featuredImage || '$staticServer/placeholder.svg?size=wide'}
			alt={item.title}
			class="h-full w-full object-cover"
		/>
		<div
			class="absolute inset-0 bg-linear-to-t from-background via-background/40 to-transparent"
		></div>

		<!-- Back Button -->
		<div class="absolute top-6 left-6 z-10" in:fly={{ x: -20, duration: 400, delay: 200 }}>
			<Button
				variant="secondary"
				size="sm"
				class="shadow-lg-lg rounded-full bg-background/80 backdrop-blur-sm hover:bg-background"
				href="/events"
			>
				<ArrowLeftIcon class="mr-2 size-4" />
				Back to Portfolio
			</Button>
		</div>

		<!-- Event Type Badge -->
		{#if item.eventType}
			<div class="absolute top-6 right-6 z-10" in:fly={{ x: 20, duration: 400, delay: 200 }}>
				<Badge
					class="shadow-lg-lg bg-primary/90 px-4 py-1.5 text-sm text-primary-foreground backdrop-blur-sm"
				>
					{item.eventType}
				</Badge>
			</div>
		{/if}
	</div>

	<!-- Content Section -->
	<div class="relative -mt-20 lg:-mt-32">
		<div class="mx-auto max-w-4xl px-4 lg:px-8">
			<div
				class="shadow-lg-xl rounded-2xl border bg-card p-6 lg:p-10"
				in:fly={{ y: 40, duration: 500, delay: 100 }}
			>
				<!-- Title -->
				<h1 class="mb-4 text-3xl font-bold tracking-tight text-foreground lg:text-4xl">
					{item.title}
				</h1>

				<!-- Meta Information -->
				<div class="mb-6 flex flex-wrap gap-4 lg:gap-6">
					{#if formattedDate}
						<div class="flex items-center gap-2 text-muted-foreground">
							<div class="flex size-9 items-center justify-center rounded-full bg-primary/10">
								<CalendarIcon class="size-4 text-primary" />
							</div>
							<div>
								<p class="text-xs text-muted-foreground/70">Date</p>
								<p class="text-sm font-medium text-foreground">{formattedDate}</p>
							</div>
						</div>
					{/if}
					{#if item.client}
						<div class="flex items-center gap-2 text-muted-foreground">
							<div class="flex size-9 items-center justify-center rounded-full bg-primary/10">
								<UserIcon class="size-4 text-primary" />
							</div>
							<div>
								<p class="text-xs text-muted-foreground/70">Client</p>
								<p class="text-sm font-medium text-foreground">{item.client}</p>
							</div>
						</div>
					{/if}
					{#if item.location}
						<div class="flex items-center gap-2 text-muted-foreground">
							<div class="flex size-9 items-center justify-center rounded-full bg-primary/10">
								<MapPinIcon class="size-4 text-primary" />
							</div>
							<div>
								<p class="text-xs text-muted-foreground/70">Location</p>
								<p class="text-sm font-medium text-foreground">{item.location}</p>
							</div>
						</div>
					{/if}
				</div>

				<Separator class="my-6" />

				<!-- Description -->
				{#if item.description}
					<div class="flex flex-col gap-4">
						<div class="flex items-center gap-2">
							<SparklesIcon class="size-5 text-primary" />
							<h2 class="text-lg font-semibold text-foreground">About This Event</h2>
						</div>
						<p class="text-base leading-relaxed text-muted-foreground lg:text-lg">
							{item.description}
						</p>
					</div>
				{/if}

				<!-- Additional Details Section -->
				<div class="mt-8 rounded-xl border border-border/50 bg-muted/50 p-6">
					<h3 class="mb-4 text-sm font-semibold tracking-wider text-foreground uppercase">
						Event Details
					</h3>
					<div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
						<div class="space-y-1">
							<p class="text-xs text-muted-foreground">Event Type</p>
							<p class="text-sm font-medium text-foreground">{item.eventType || 'Not specified'}</p>
						</div>
						<div class="space-y-1">
							<p class="text-xs text-muted-foreground">Event ID</p>
							<p class="text-sm font-medium text-foreground">#{item.id}</p>
						</div>
						<div class="space-y-1">
							<p class="text-xs text-muted-foreground">Slug</p>
							<p class="font-mono text-sm font-medium text-foreground">{item.slug}</p>
						</div>
						<div class="space-y-1">
							<p class="text-xs text-muted-foreground">Status</p>
							<Badge variant="outline" class="text-xs">Completed</Badge>
						</div>
					</div>
				</div>

				<!-- CTA Section -->
				<div class="mt-8 flex flex-col gap-3 sm:flex-row">
					<Button class="flex-1 rounded-full" size="lg">Contact Us About This Event</Button>
					<Button variant="outline" class="flex-1 rounded-full" size="lg" onclick={onBack}
						>View More Events</Button
					>
				</div>
			</div>
		</div>
	</div>

	<!-- Spacer -->
	<div class="h-20"></div>
</div>
