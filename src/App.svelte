<script>
	import Nav from "./components/Nav.svelte";
	import Tailwindcss from "./Tailwindcss.svelte";
	import { Router, Route, Link } from "svelte-navigator";
</script>

<Tailwindcss />
<Nav />
<main>
	<video class="fixed top-0 h-full min-w-full object-cover" loop autoplay muted src="./assets/bg.mp4">
	</video>
	<div class="fixed top-0 h-screen w-screen bg-black opacity-80"></div>
	<div class="absolute top-80 lg:top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
		<h1 class="text-white font-bold tracking-wider text-3xl lg:text-5xl ">Welcome to our car rental</h1>
		<p class="text-white lg:text-2xl text-lg py-5">If you want to use our service please login</p>
		<a class="inline-block my-2 ml-auto lg:mr-3 py-3 px-10 bg-gray-50 hover:bg-gray-100 text-xl text-gray-900 font-bold rounded-xl transition duration-200" href="#">Sign In</a>
		<a class="inline-block my-2 py-3 px-10 bg-blue-500 hover:bg-blue-600 text-xl text-white font-bold rounded-xl transition duration-200" href="#">Sign up</a>
	</div>
</main>
