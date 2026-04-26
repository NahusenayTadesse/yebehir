<script lang="ts">
	import { Button } from '$lib/components/ui/button';
	import { Badge } from '$lib/components/ui/badge';
	import {
		CalendarIcon,
		MapPinIcon,
		TrendingUpIcon,
		ArrowRightIcon,
		SparklesIcon
	} from '@lucide/svelte';
	import ServiceCard from './service-card.svelte';
	import { fade, fly } from 'svelte/transition';

	const services = [
		{
			icon: CalendarIcon,
			title: 'Yebehir Events',
			description: 'Full-service event management for corporate clients, brands, and private events'
		},
		{
			icon: MapPinIcon,
			title: '4 Kilo Plaza',
			description: 'A central, flexible venue for events in Addis Ababa'
		},
		{
			icon: TrendingUpIcon,
			title: 'Sales Division',
			description: 'Sponsorships, partnerships, and event-based marketing opportunities'
		}
	];
</script>

<section
	class="relative min-h-dvh w-full overflow-hidden bg-gradient-to-br from-primary/10 via-background to-accent/10"
>
	<!-- Background decorative elements -->
	<div class="absolute inset-0 overflow-hidden">
		<div class="absolute -top-40 -right-40 size-80 rounded-full bg-primary/20 blur-3xl"></div>
		<div class="absolute top-1/2 -left-20 size-60 rounded-full bg-accent/20 blur-3xl"></div>
		<div class="absolute right-1/4 bottom-20 size-40 rounded-full bg-primary/15 blur-2xl"></div>
	</div>

	<!-- Grid pattern overlay -->
	<div
		class="absolute inset-0 bg-[linear-gradient(rgba(0,0,0,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(0,0,0,0.02)_1px,transparent_1px)] bg-[size:60px_60px] dark:bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)]"
	></div>

	<div
		class="relative z-10 mx-auto flex min-h-dvh max-w-7xl flex-col items-center justify-center px-6 py-20"
	>
		<!-- Hero content -->
		<div class="flex flex-col items-center text-center" in:fade={{ duration: 600 }}>
			<!-- Badge -->
			<div in:fly={{ y: 20, duration: 500, delay: 100 }}>
				<Badge
					variant="outline"
					class="mb-6 gap-2 border-primary/30 bg-primary/5 px-4 py-2 text-sm font-medium text-primary"
				>
					<SparklesIcon class="size-4" />
					Creating Unforgettable Experiences
				</Badge>
			</div>

			<!-- Company name -->
			<h1
				class="mb-4 bg-gradient-to-r from-foreground via-primary to-foreground bg-clip-text text-5xl font-bold tracking-tight text-transparent sm:text-6xl md:text-7xl lg:text-8xl"
				in:fly={{ y: 30, duration: 600, delay: 200 }}
			>
				Yebehir Ventures
			</h1>

			<!-- Tagline -->
			<p
				class="mb-6 text-2xl font-semibold text-primary sm:text-3xl md:text-4xl"
				in:fly={{ y: 30, duration: 600, delay: 300 }}
			>
				Ahead of the curve
			</p>

			<!-- Description -->
			<p
				class="mb-10 max-w-2xl text-lg text-muted-foreground sm:text-xl"
				in:fly={{ y: 30, duration: 600, delay: 400 }}
			>
				We don't just organize events—we create experiences, generate revenue opportunities, and
				connect brands with audiences across Addis Ababa and beyond.
			</p>

			<!-- CTA Buttons -->
			<div class="flex flex-col gap-4 sm:flex-row" in:fly={{ y: 30, duration: 600, delay: 500 }}>
				<Button
					size="lg"
					class="shadow-lg-lg shadow-lg-primary/25 hover:shadow-lg-xl hover:shadow-lg-primary/30 gap-2 px-8 text-base transition-all duration-300"
				>
					Explore Our Services
					<ArrowRightIcon class="size-5" />
				</Button>
				<Button
					size="lg"
					variant="outline"
					class="px-8 text-base transition-all duration-300 hover:bg-primary/5">Contact Us</Button
				>
			</div>
		</div>

		<!-- Service cards -->
		<div
			class="mt-20 grid w-full max-w-5xl gap-6 sm:grid-cols-2 lg:grid-cols-3"
			in:fly={{ y: 40, duration: 700, delay: 700 }}
		>
			{#each services as service, index}
				<ServiceCard {service} delay={index * 100} />
			{/each}
		</div>

		<!-- Stats or trust indicators -->
		<div
			class="mt-16 flex flex-wrap items-center justify-center gap-8 text-center sm:gap-16"
			in:fly={{ y: 30, duration: 600, delay: 1000 }}
		>
			<div>
				<p class="text-3xl font-bold text-primary sm:text-4xl">500+</p>
				<p class="text-sm text-muted-foreground">Events Delivered</p>
			</div>
			<div class="h-12 w-px bg-border"></div>
			<div>
				<p class="text-3xl font-bold text-primary sm:text-4xl">100+</p>
				<p class="text-sm text-muted-foreground">Brand Partners</p>
			</div>
			<div class="h-12 w-px bg-border"></div>
			<div>
				<p class="text-3xl font-bold text-primary sm:text-4xl">50K+</p>
				<p class="text-sm text-muted-foreground">Attendees Reached</p>
			</div>
		</div>
	</div>

	<!-- Scroll indicator -->
	<div class="absolute bottom-8 left-1/2 -translate-x-1/2">
		<div
			class="flex h-10 w-6 items-start justify-center rounded-full border-2 border-muted-foreground/30 p-1"
		>
			<div class="h-2 w-1 animate-bounce rounded-full bg-muted-foreground/50"></div>
		</div>
	</div>
</section>
