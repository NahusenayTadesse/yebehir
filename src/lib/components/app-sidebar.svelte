<script lang="ts">
	import {
		Users,
		UserRoundCog,
		ChartArea,
		LayoutDashboard,
		CalendarDays,
		MapPin,
		TrendingUp,
		Plus,
		Sheet,
		Mail,
		Star,
		Image,
		Quote,
		Briefcase
	} from '@lucide/svelte';
	import * as Sidebar from '$lib/components/ui/sidebar/index.js';
	import type { ComponentProps } from 'svelte';
	import { bgGradient } from '$lib/global.svelte';
	import { useSidebar } from '$lib/components/ui/sidebar/index.js';

	import NavMain from './NavMain.svelte';

	let { ...restProps }: ComponentProps<typeof Sidebar.Root> = $props();

	const navigation = [
		{ title: 'Dashboard', url: '/dashboard', icon: LayoutDashboard },

		{
			title: 'Quote Requests',
			url: '/dashboard/quotes',
			icon: Quote,
			items: [
				{ title: 'View All', url: '/dashboard/quotes', icon: Sheet },
				{ title: 'Pending', url: '/dashboard/quotes/pending', icon: Sheet }
			]
		},

		{
			title: 'Events & Portfolio',
			url: '/dashboard/events',
			icon: Briefcase,
			items: [
				{ title: 'All Portfolio Items', url: '/dashboard/events', icon: Sheet },
				{ title: 'Add Event', url: '/dashboard/events/add-event', icon: Plus }
			]
		},

		{
			title: 'Venue Management',
			url: '/dashboard/venue',
			icon: MapPin,
			items: [
				{ title: '4 Kilo Plaza Info', url: '/dashboard/venue/info', icon: Sheet },
				{ title: 'Booking Calendar', url: '/dashboard/venue/calendar', icon: CalendarDays }
			]
		},

		{
			title: 'Services',
			url: '/dashboard/services',
			icon: TrendingUp,
			items: [
				{ title: 'Manage Services', url: '/dashboard/services', icon: Sheet },
				{ title: 'Add Service', url: '/dashboard/services/add', icon: Plus }
			]
		},

		{
			title: 'Messages',
			url: '/dashboard/messages',
			icon: Mail
		},

		{
			title: 'Gallery',
			url: '/dashboard/gallery',
			icon: Image
		},

		{
			title: 'Testimonials',
			url: '/dashboard/testimonials',
			icon: Star
		},

		{
			title: 'Reports',
			url: '/dashboard/reports',
			icon: ChartArea
		},

		{
			title: 'Admin Panel',
			url: '/dashboard/admin-panel',
			icon: UserRoundCog,
			items: [
				{ title: 'Users', url: '/dashboard/admin-panel/users', icon: Users },
				{ title: 'Roles', url: '/dashboard/admin-panel/roles', icon: Users }
			]
		}
	];

	const sidebar = useSidebar();

	function closeSidebar() {
		if (sidebar.isMobile) {
			sidebar.setOpenMobile(false);
		}
	}
</script>

<Sidebar.Root collapsible="offcanvas" {...restProps}>
	<Sidebar.Content
		class="z-9999! h-full overflow-y-scroll pt-4 [scrollbar-width:thin] {bgGradient}"
	>
		<Sidebar.Group>
			<Sidebar.GroupLabel>
				<a
					class="flex flex-row items-center justify-center gap-4"
					href="/"
					title="Go to Website Home Page"
					target="_blank"
				>
					<img src="/logoDark.webp" class="block h-16 w-16 object-contain dark:hidden" alt="Logo" />
					<img src="/logo.webp" class="hidden h-16 w-16 object-contain dark:block" alt="Logo" />
					<h4 class="text-center text-[16px]! font-bold">Yebehir Ventures</h4>
				</a>
			</Sidebar.GroupLabel>

			<Sidebar.GroupContent class="my-6">
				<NavMain items={navigation} />
			</Sidebar.GroupContent>
		</Sidebar.Group>
	</Sidebar.Content>

	<Sidebar.Footer class="flex flex-row border-t bg-background">
		<Sidebar.GroupLabel>
			Powered By <a
				href="https://nahusenaytadesse.vercel.app"
				target="_blank"
				class="ml-1 hover:underline">NT</a
			>
		</Sidebar.GroupLabel>
	</Sidebar.Footer>
</Sidebar.Root>
