<script>
  import { push } from "svelte-spa-router";

  let cars = [];

  (async () => {
    const res = await fetch("../public/server/views/cars.php");
    if (res.status !== 200) push("#/");

    const json = await res.json();
    cars = json.cars;
    console.log(cars);
  })();
</script>

<section class="antialiased bg-gray-100 text-gray-600 h-screen px-4">
  <div class="flex flex-col flex-start h-full">
    <!-- Table -->
    <div class="mx-auto bg-white shadow-lg rounded-sm border border-gray-200 mt-12">
      <header class="px-5 py-4 border-b border-gray-100">
        <h2 class="font-semibold text-gray-800">Cars</h2>
      </header>
      <div class="p-3">
        <div class="overflow-x-auto">
          <table class="table-auto w-full">
            <thead
              class="text-xs font-semibold uppercase text-gray-400 bg-gray-50"
            >
              <tr>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-left">Photo</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-left">Brand</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-left">Model</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Year</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Condition</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Mileage</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Vin number</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">
                    Registration number
                  </div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Color</div>
                </th>
                <th class="p-2 whitespace-nowrap">
                  <div class="font-semibold text-center">Price</div>
                </th>
              </tr>
            </thead>
            <tbody class="text-sm divide-y divide-gray-100">
              {#each cars as car}
                <tr>
                  <td class="p-2 whitespace-nowrap">
                    <div class="td">
                      <img class="car-img" src={car.img} alt={car.model} />
                    </div>
                  </td>
                  <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">{car.brand}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">{car.model}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">{car.year}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">{car.condition}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-right">{car.mileage} km</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{car.vin_num}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-center">{car.register_num}</div>
                  </td>

                  <td class="p-2 whitespace-nowrap">
                    <div class="text-center">{car.color.toUpperCase()}</div>
                  </td>
                  
                  <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                      {car.price} PLN
                    </div>
                  </td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .td {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
  }

  .car-img {
    width: 350px;
    border-radius: 20px;
  }
</style>
