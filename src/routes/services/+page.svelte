<script lang="ts">
	import ServiceGrid from '$lib/components/services/service-grid.svelte';
	import { SparklesIcon } from '@lucide/svelte';

	let { data } = $props();
</script>

<svelte:head>
	<title>Our Services | Event Management, Venue & Sponsorship | Yebehir Ventures</title>
	<meta
		name="title"
		content="Our Services | Event Management, Venue & Sponsorship | Yebehir Ventures"
	/>
	<meta
		name="description"
		content="Discover Yebehir Ventures' comprehensive service units: Professional Event Management, 4 Kilo Plaza Venue Operations, and Sales-driven Brand Sponsorships in Addis Ababa."
	/>

	<!-- Open Graph -->
	<meta property="og:type" content="website" />
	<meta property="og:url" content="/services" />
	<meta property="og:title" content="Multi-Service Excellence | Yebehir Ventures" />
	<meta
		property="og:description"
		content="We don’t just organize events—we create experiences, manage top-tier venues, and connect brands with audiences."
	/>
	<meta property="og:image" content="/logo.png" />

	<!-- Twitter -->
	<meta property="twitter:card" content="summary_large_image" />
	<meta property="twitter:title" content="Yebehir Ventures | Services Overview" />
	<meta property="twitter:image" content="/logo.png" />

	<link rel="canonical" href="/services" />
</svelte:head>
<section
	class="relative mb-10 overflow-hidden bg-muted/30 bg-cover bg-center px-4 py-20 text-white sm:py-32"
	style="background-image: url('/event (1).webp')"
>
	<div class="absolute inset-0 bg-primary/60"></div>
	<!-- <div
		class="absolute inset-0 bg-[radial-gradient(ellipse_at_top_right,_var(--tw-gradient-stops))] from-primary/20 via-transparent to-transparent"
	></div> -->

	<!-- Content -->
	<div class="relative mx-auto max-w-4xl px-4 text-center">
		<div
			class="mb-6 inline-flex items-center gap-2 rounded-full bg-primary/10 px-4 py-2 text-sm font-medium text-secondary"
		>
			<SparklesIcon class="size-4" />
			<span>Our Services</span>
		</div>
		<h1 class="mb-6 text-4xl font-bold tracking-tight text-white sm:text-5xl lg:text-6xl">
			Ahead of the Curve
		</h1>
		<p class="mx-auto max-w-2xl text-lg leading-relaxed text-secondary sm:text-xl">
			Yebehir Ventures provides a multi-service platform integrating cinematic event management,
			premium venue operations at 4 Kilo Plaza, and strategic brand monetization.
		</p>
	</div>
</section>

{#if data?.servicesItems.length}
	<ServiceGrid services={data.servicesItems} />
	<br />
{/if}
