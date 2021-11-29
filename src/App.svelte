<script>
  import Nav from "./components/Nav.svelte";
  import Home from "./views/Home.svelte";
  import Login from "./views/Login.svelte";
  import Cars from "./views/Cars.svelte";
  import Register from "./views/Register.svelte";
  import Tailwindcss from "./Tailwindcss.svelte";
  import Router from "svelte-spa-router";
</script>

<Tailwindcss />
<Nav />
<Router routes={{ "/": Home, "/login": Login, "/register": Register, "/cars": Cars }} />
