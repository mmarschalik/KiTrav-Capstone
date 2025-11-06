export default function Page() {
  return (
    <section className="grid gap-10">
      {/* Hero */}
      <div className="text-center">
        <h1 className="text-3xl md:text-5xl font-semibold mb-3">Plan. Book. Go.</h1>
        <p className="text-gray-600">Search flights, hotels, cars — then one-click build your itinerary.</p>
      </div>

      {/* Search (disabled visuals) */}
      <div className="max-w-3xl mx-auto w-full">
        <div className="flex gap-2">
          <input
            className="flex-1 border rounded-xl px-4 py-3 opacity-60 cursor-not-allowed"
            placeholder='e.g., "Phoenix → Las Vegas this weekend, 2 people, 4-star casino"'
            disabled
            aria-disabled="true"
          />
          <button
            className="px-5 py-3 rounded-xl border opacity-60 cursor-not-allowed"
            disabled
            aria-disabled="true"
          >
            Search
          </button>
        </div>
        <div className="flex flex-wrap gap-2 mt-3">
          <span className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full border text-sm opacity-60 cursor-not-allowed select-none">
            Flights
          </span>
          <span className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full border text-sm opacity-60 cursor-not-allowed select-none">
            Hotels
          </span>
          <span className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full border text-sm opacity-60 cursor-not-allowed select-none">
            Car Rental
          </span>
          <span className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full border text-sm opacity-60 cursor-not-allowed select-none">
            + Add activity / eBook
          </span>
        </div>
      </div>

      {/* Loading ticker (static mock) */}
      <div className="max-w-3xl mx-auto w-full">
        <div className="rounded-xl border p-4 text-sm text-gray-600">
          <div className="grid gap-2 md:grid-cols-2">
            <div className="rounded-lg border p-3">Researching your destination…</div>
            <div className="rounded-lg border p-3">Gathering flights…</div>
            <div className="rounded-lg border p-3">Gathering hotels…</div>
            <div className="rounded-lg border p-3">Defining your itinerary…</div>
          </div>
        </div>
      </div>

      {/* Placeholder results (static, non-interactive) */}
      <div className="max-w-6xl mx-auto w-full grid gap-6 md:grid-cols-3">
        <div className="rounded-2xl border p-4 pointer-events-none opacity-70">
          <div className="h-28 rounded-xl border mb-3"></div>
          <h3 className="font-medium mb-1">Flight Option</h3>
          <p className="text-sm text-gray-600">PHX → LAS • Nonstop • 1h 10m</p>
          <p className="text-sm text-gray-600">$128 roundtrip</p>
          <div className="mt-3 h-9 rounded-lg border"></div>
        </div>
        <div className="rounded-2xl border p-4 pointer-events-none opacity-70">
          <div className="h-28 rounded-xl border mb-3"></div>
          <h3 className="font-medium mb-1">Hotel Option</h3>
          <p className="text-sm text-gray-600">4-star casino resort • Strip</p>
          <p className="text-sm text-gray-600">$159 / night</p>
          <div className="mt-3 h-9 rounded-lg border"></div>
        </div>
        <div className="rounded-2xl border p-4 pointer-events-none opacity-70">
          <div className="h-28 rounded-xl border mb-3"></div>
          <h3 className="font-medium mb-1">Activity Option</h3>
          <p className="text-sm text-gray-600">Neon Museum + Club entry</p>
          <p className="text-sm text-gray-600">Bundle preview</p>
          <div className="mt-3 h-9 rounded-lg border"></div>
        </div>
      </div>

      {/* Disabled CTA bar */}
      <div className="sticky bottom-6 w-full">
        <div className="max-w-3xl mx-auto border rounded-2xl p-4 flex items-center justify-between bg-white/50 backdrop-blur">
          <div>
            <p className="font-medium">Your Trip</p>
            <p className="text-sm text-gray-600">Select options to build an itinerary</p>
          </div>
          <button
            className="px-5 py-3 rounded-xl border opacity-60 cursor-not-allowed"
            disabled
            aria-disabled="true"
          >
            Create Itinerary
          </button>
        </div>
      </div>
    </section>
  );
}
