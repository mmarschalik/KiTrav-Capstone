const features = [
  {
    icon: "🧭",
    title: "Unified Search",
    copy: "Compare flights, stays, and activities in one stream of results.",
  },
  {
    icon: "🧠",
    title: "Smart Bundles",
    copy: "Our AI pairs flights, hotels, and add-ons that actually fit together.",
  },
  {
    icon: "⚡",
    title: "One-Tap Itinerary",
    copy: "Lock in the perfect plan and share it with your travel group instantly.",
  },
];

const highlights = [
  { label: "Destinations analyzed", value: "120+" },
  { label: "Average planning time saved", value: "8 hrs" },
  { label: "Trip satisfaction score", value: "4.9/5" },
];

const mockCards = [
  {
    title: "Flight · PHX → LAS",
    detail: "Nonstop · 1h 10m · $128",
  },
  {
    title: "Hotel · Lumen Sky",
    detail: "4★ boutique · $159/night",
  },
  {
    title: "Activity · Neon After Dark",
    detail: "Museum + club bundle",
  },
];

export default function Page() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 text-white">
      <div className="mx-auto flex min-h-screen w-full max-w-6xl flex-col px-6 pb-16 pt-8 md:px-10 lg:px-12">
        <header className="flex items-center justify-between rounded-full border border-white/10 bg-white/5 px-5 py-3 backdrop-blur">
          <span className="text-lg font-semibold tracking-tight">KiTrav</span>
          <nav className="hidden gap-6 text-sm text-white/70 md:flex">
            <a className="transition hover:text-white" href="#">
              Product
            </a>
            <a className="transition hover:text-white" href="#">
              Pricing
            </a>
            <a className="transition hover:text-white" href="#">
              Stories
            </a>
            <a className="transition hover:text-white" href="#">
              Support
            </a>
          </nav>
          <button className="rounded-full border border-white/20 px-4 py-2 text-sm font-medium text-white/80 transition hover:border-white/40 hover:text-white">
            Get access
          </button>
        </header>

        <section className="relative mt-12 grid gap-10 rounded-[32px] border border-white/10 bg-white/5 px-8 py-16 text-center backdrop-blur">
          <div className="absolute -inset-px rounded-[32px] border border-white/5 blur-[1px]"></div>
          <div className="relative mx-auto max-w-3xl space-y-6">
            <span className="inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/5 px-4 py-1 text-sm text-white/70">
              ✈️ Smarter travel planning
            </span>
            <h1 className="text-4xl font-semibold leading-tight tracking-tight text-white md:text-6xl">
              Plan every leg of your journey in one fluid workspace.
            </h1>
            <p className="text-lg text-white/70">
              KiTrav assembles flights, hotels, experiences, and logistics side-by-side—so you can make confident decisions without juggling tabs.
            </p>
          </div>

          <div className="relative mx-auto w-full max-w-3xl rounded-2xl border border-white/10 bg-slate-950/50 p-5 text-left shadow-2xl">
            <p className="text-xs uppercase tracking-[0.3em] text-white/50">Planner Preview</p>
            <div className="mt-5 grid gap-4 lg:grid-cols-[2fr,1fr]">
              <div className="rounded-2xl border border-white/10 bg-white/5 p-4">
                <div className="flex flex-wrap gap-2 text-sm text-white/80">
                  {["Flights", "Hotels", "Car rental", "+ Activities"].map((chip) => (
                    <span key={chip} className="rounded-full border border-white/10 px-3 py-1">
                      {chip}
                    </span>
                  ))}
                </div>
                <input
                  className="mt-4 w-full rounded-xl border border-white/10 bg-slate-900/60 px-4 py-3 text-sm text-white placeholder:text-white/40"
                  placeholder='Try "Lisbon to Porto next month, 2 travelers"'
                  disabled
                />
                <div className="mt-4 grid gap-3 md:grid-cols-2">
                  {["Researching destinations…", "Gathering flights…", "Curating stays…", "Stacking activities…"].map((item) => (
                    <div key={item} className="rounded-xl border border-white/5 bg-white/5 px-3 py-2 text-sm text-white/70">
                      {item}
                    </div>
                  ))}
                </div>
              </div>
              <div className="flex flex-col gap-3 rounded-2xl border border-white/10 bg-white/5 p-4">
                {mockCards.map((card) => (
                  <div key={card.title} className="rounded-xl border border-white/5 bg-slate-950/50 p-3">
                    <p className="text-sm font-medium">{card.title}</p>
                    <p className="text-xs text-white/60">{card.detail}</p>
                    <div className="mt-2 h-2 rounded-full bg-white/10">
                      <div className="h-full w-2/3 rounded-full bg-sky-400"></div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          <div className="relative flex flex-wrap justify-center gap-6 text-left text-white/70">
            {highlights.map((item) => (
              <div key={item.label} className="min-w-[160px] rounded-2xl border border-white/10 bg-white/5 px-5 py-4 text-center">
                <p className="text-sm uppercase tracking-widest text-white/50">{item.label}</p>
                <p className="mt-2 text-2xl font-semibold text-white">{item.value}</p>
              </div>
            ))}
          </div>
        </section>

        <section className="mt-14 grid gap-6 md:grid-cols-3">
          {features.map((feature) => (
            <div key={feature.title} className="rounded-3xl border border-white/10 bg-white/5 p-6 shadow-lg">
              <div className="flex items-center gap-3 text-white">
                <span className="flex h-10 w-10 items-center justify-center rounded-2xl border border-white/10 bg-white/5 text-xl">
                  {feature.icon}
                </span>
                <p className="text-xs uppercase tracking-[0.3em] text-white/50">Feature</p>
              </div>
              <h3 className="mt-3 text-xl font-semibold text-white">{feature.title}</h3>
              <p className="mt-2 text-sm text-white/70">{feature.copy}</p>
              <div className="mt-6 h-1 w-16 rounded-full bg-gradient-to-r from-sky-400 to-emerald-400"></div>
            </div>
          ))}
        </section>

        <section className="mt-14 rounded-3xl border border-white/10 bg-gradient-to-r from-sky-500/20 to-emerald-500/20 px-8 py-10 text-center text-white">
          <p className="text-sm uppercase tracking-[0.4em] text-white/70">Trusted by modern explorers</p>
          <h2 className="mt-4 text-3xl font-semibold">
            “KiTrav shaved hours off our itinerary planning. Everything we needed was highlighted for us.”
          </h2>
          <p className="mt-3 text-white/70">Camila N., Remote Creative</p>
        </section>

        <footer className="mt-16 flex flex-col items-center gap-4 text-center text-white/70">
          <p className="text-2xl font-semibold text-white">Ready to craft your next trip?</p>
          <div className="flex flex-wrap justify-center gap-3">
            <button className="rounded-full border border-white/20 px-6 py-3 text-sm font-medium text-white transition hover:border-white/40">
              Explore the product
            </button>
            <button className="rounded-full bg-white px-6 py-3 text-sm font-semibold text-slate-900 transition hover:bg-slate-100">
              Request a demo
            </button>
          </div>
          <p className="text-xs text-white/50">© {new Date().getFullYear()} KiTrav. All rights reserved.</p>
        </footer>
      </div>
    </main>
  );
}
