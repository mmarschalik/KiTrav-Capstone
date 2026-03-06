import { useState } from "react";

const BRAND = {
  blue: "#1a3fc4",
  red: "#d42b2b",
  lightBlue: "#e8eeff",
  lightRed: "#fff0f0",
  gray: "#f4f5f7",
  border: "#e2e5ec",
  text: "#1a1f36",
  muted: "#8a93a8",
  white: "#ffffff",
};

const GROUP_COLORS = {
  core:      { accent: "#1a3fc4", light: "#e8eeff" },
  itinerary: { accent: "#0ea87e", light: "#e6f8f3" },
  flight:    { accent: "#0099cc", light: "#e0f4fb" },
  hotel:     { accent: "#7c55d4", light: "#f0ebff" },
  commerce:  { accent: "#d42b2b", light: "#fff0f0" },
  extras:    { accent: "#e8880a", light: "#fff5e6" },
};

const entities = [
  { id: "User", group: "core", attrs: [
    { name: "user_id", tag: "PK" }, { name: "first_name" }, { name: "last_name" },
    { name: "email" }, { name: "password_hash" }, { name: "phone_number" },
    { name: "country" }, { name: "subscription_type" }, { name: "created_at" }, { name: "updated_at" },
  ]},
  { id: "Trip", group: "core", attrs: [
    { name: "trip_id", tag: "PK" }, { name: "user_id", tag: "FK" }, { name: "trip_name" },
    { name: "destination_city" }, { name: "destination_country" }, { name: "start_date" },
    { name: "end_date" }, { name: "budget" }, { name: "traveler_count" }, { name: "status" },
    { name: "created_at" }, { name: "updated_at" },
  ]},
  { id: "Itinerary", group: "itinerary", attrs: [
    { name: "itinerary_id", tag: "PK" }, { name: "trip_id", tag: "FK" }, { name: "title" },
    { name: "summary" }, { name: "generated_by_ai" }, { name: "total_estimated_cost" },
    { name: "created_at" }, { name: "updated_at" },
  ]},
  { id: "ItineraryItem", group: "itinerary", attrs: [
    { name: "item_id", tag: "PK" }, { name: "itinerary_id", tag: "FK" }, { name: "day_number" },
    { name: "item_type" }, { name: "title" }, { name: "description" }, { name: "location_name" },
    { name: "start_time" }, { name: "end_time" }, { name: "estimated_cost" }, { name: "notes" },
  ]},
  { id: "FlightSearch", group: "flight", attrs: [
    { name: "flight_search_id", tag: "PK" }, { name: "user_id", tag: "FK" }, { name: "trip_id", tag: "FK" },
    { name: "origin_airport" }, { name: "destination_airport" }, { name: "departure_date" },
    { name: "return_date" }, { name: "adults" }, { name: "children" }, { name: "cabin_class" }, { name: "created_at" },
  ]},
  { id: "FlightOffer", group: "flight", attrs: [
    { name: "flight_offer_id", tag: "PK" }, { name: "flight_search_id", tag: "FK" },
    { name: "external_offer_ref" }, { name: "airline_name" }, { name: "departure_airport" },
    { name: "arrival_airport" }, { name: "departure_time" }, { name: "arrival_time" },
    { name: "duration" }, { name: "price" }, { name: "currency" },
  ]},
  { id: "HotelSearch", group: "hotel", attrs: [
    { name: "hotel_search_id", tag: "PK" }, { name: "user_id", tag: "FK" }, { name: "trip_id", tag: "FK" },
    { name: "city" }, { name: "country" }, { name: "check_in_date" }, { name: "check_out_date" },
    { name: "guests" }, { name: "rooms" }, { name: "created_at" },
  ]},
  { id: "HotelOffer", group: "hotel", attrs: [
    { name: "hotel_offer_id", tag: "PK" }, { name: "hotel_search_id", tag: "FK" },
    { name: "external_offer_ref" }, { name: "hotel_name" }, { name: "room_type" },
    { name: "address" }, { name: "rating" }, { name: "price_per_night" }, { name: "total_price" }, { name: "currency" },
  ]},
  { id: "Booking", group: "commerce", attrs: [
    { name: "booking_id", tag: "PK" }, { name: "user_id", tag: "FK" }, { name: "trip_id", tag: "FK" },
    { name: "booking_type" }, { name: "provider_name" }, { name: "external_booking_ref" },
    { name: "booking_status" }, { name: "total_amount" }, { name: "currency" }, { name: "booked_at" },
  ]},
  { id: "Payment", group: "commerce", attrs: [
    { name: "payment_id", tag: "PK" }, { name: "booking_id", tag: "FK" }, { name: "payment_method" },
    { name: "amount" }, { name: "currency" }, { name: "payment_status" },
    { name: "transaction_reference" }, { name: "paid_at" },
  ]},
  { id: "LoyaltyAccount", group: "extras", attrs: [
    { name: "loyalty_account_id", tag: "PK" }, { name: "user_id", tag: "FK" }, { name: "program_name" },
    { name: "membership_number" }, { name: "tier_level" }, { name: "points_balance" }, { name: "linked_at" },
  ]},
  { id: "TravelRequirement", group: "extras", attrs: [
    { name: "requirement_id", tag: "PK" }, { name: "destination_country" }, { name: "passport_country" },
    { name: "visa_required" }, { name: "visa_type" }, { name: "minimum_passport_validity" },
    { name: "notes" }, { name: "last_updated" },
  ]},
];

const relationships = [
  { from: "User", to: "Trip", card: "1 : M", note: "User owns Trip" },
  { from: "User", to: "FlightSearch", card: "1 : M", note: "User initiates FlightSearch" },
  { from: "User", to: "HotelSearch", card: "1 : M", note: "User initiates HotelSearch" },
  { from: "User", to: "Booking", card: "1 : M", note: "User makes Booking" },
  { from: "User", to: "LoyaltyAccount", card: "1 : M", note: "User holds LoyaltyAccount" },
  { from: "Trip", to: "Itinerary", card: "1 : M", note: "Trip has Itinerary" },
  { from: "Trip", to: "Booking", card: "1 : M", note: "Trip contains Booking" },
  { from: "Trip", to: "FlightSearch", card: "1 : M", note: "Trip linked to FlightSearch" },
  { from: "Trip", to: "HotelSearch", card: "1 : M", note: "Trip linked to HotelSearch" },
  { from: "Itinerary", to: "ItineraryItem", card: "1 : M", note: "Itinerary contains ItineraryItem" },
  { from: "FlightSearch", to: "FlightOffer", card: "1 : M", note: "FlightSearch returns FlightOffer" },
  { from: "HotelSearch", to: "HotelOffer", card: "1 : M", note: "HotelSearch returns HotelOffer" },
  { from: "Booking", to: "Payment", card: "1 : 1", note: "Booking paid via Payment" },
];

const groups = [
  { key: "core",      label: "Core",      ids: ["User", "Trip"] },
  { key: "itinerary", label: "Itinerary", ids: ["Itinerary", "ItineraryItem"] },
  { key: "flight",    label: "Flights",   ids: ["FlightSearch", "FlightOffer"] },
  { key: "hotel",     label: "Hotels",    ids: ["HotelSearch", "HotelOffer"] },
  { key: "commerce",  label: "Commerce",  ids: ["Booking", "Payment"] },
  { key: "extras",    label: "Extras",    ids: ["LoyaltyAccount", "TravelRequirement"] },
];

function KitraviaLogo() {
  return (
    <svg height="28" viewBox="0 0 220 40" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="0" y="32" fontFamily="Arial Black, Arial, sans-serif" fontWeight="900" fontSize="34" fill="#1a3fc4">Kitra</text>
      <text x="104" y="32" fontFamily="Arial Black, Arial, sans-serif" fontWeight="900" fontSize="34" fill="#d42b2b">via</text>
      {/* Wing */}
      <g transform="translate(168, 4)">
        <path d="M4 14 C10 5, 24 2, 38 5 L36 9 C24 6, 12 9, 7 16 Z" fill="#d42b2b"/>
        <path d="M4 17 C11 10, 26 7, 40 11 L38 15 C26 10, 13 13, 8 20 Z" fill="#d42b2b"/>
        <path d="M4 20 C13 14, 28 12, 42 17 L40 21 C28 15, 15 17, 8 23 Z" fill="#d42b2b"/>
        <path d="M4 23 C14 18, 30 17, 43 23 L4 30 Z" fill="#d42b2b" opacity="0.65"/>
      </g>
    </svg>
  );
}

function EntityCard({ entity, isHighlighted, isRelated, isDimmed, onClick }) {
  const gc = GROUP_COLORS[entity.group];
  return (
    <div
      onClick={() => onClick(entity.id)}
      style={{
        background: BRAND.white,
        border: `1.5px solid ${isHighlighted ? gc.accent : isRelated ? gc.accent + "99" : BRAND.border}`,
        borderRadius: 10,
        cursor: "pointer",
        transition: "all 0.18s ease",
        opacity: isDimmed ? 0.3 : 1,
        boxShadow: isHighlighted
          ? `0 0 0 3px ${gc.accent}22, 0 6px 24px ${gc.accent}18`
          : isRelated ? `0 2px 12px ${gc.accent}18` : "0 1px 3px rgba(0,0,0,0.05)",
        minWidth: 205,
        maxWidth: 235,
        overflow: "hidden",
        fontFamily: "'Courier New', monospace",
      }}
    >
      <div style={{ height: 3, background: gc.accent, opacity: isHighlighted ? 1 : isRelated ? 0.75 : 0.35 }} />
      <div style={{
        padding: "8px 12px",
        display: "flex", alignItems: "center", gap: 7,
        borderBottom: `1px solid ${BRAND.border}`,
        background: isHighlighted ? gc.light : BRAND.white,
      }}>
        <div style={{ width: 8, height: 8, borderRadius: 2, background: gc.accent, opacity: isHighlighted ? 1 : 0.45, flexShrink: 0 }} />
        <span style={{ fontWeight: 700, fontSize: 12, color: isHighlighted ? gc.accent : BRAND.text, letterSpacing: "0.01em" }}>
          {entity.id}
        </span>
      </div>
      <div>
        {entity.attrs.map((attr, i) => (
          <div key={attr.name} style={{
            display: "flex", alignItems: "center", justifyContent: "space-between",
            padding: "3.5px 12px",
            borderBottom: i < entity.attrs.length - 1 ? `1px solid ${BRAND.gray}` : "none",
            background: attr.tag === "PK" ? "#fffdf0" : attr.tag === "FK" ? "#f5f7ff" : "transparent",
          }}>
            <span style={{
              fontSize: 10, letterSpacing: "0.01em",
              color: attr.tag === "PK" ? "#8a6200" : attr.tag === "FK" ? BRAND.blue : BRAND.muted,
              fontWeight: attr.tag ? 700 : 400,
            }}>{attr.name}</span>
            {attr.tag && (
              <span style={{
                fontSize: 9, fontWeight: 700,
                color: attr.tag === "PK" ? "#8a6200" : BRAND.blue,
                background: attr.tag === "PK" ? "#fef3c7" : "#dbeafe",
                padding: "1px 5px", borderRadius: 3, letterSpacing: "0.06em",
              }}>{attr.tag}</span>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}

export default function KitraviaER() {
  const [selected, setSelected] = useState(null);
  const [activeGroup, setActiveGroup] = useState(null);
  const [copied, setCopied] = useState(false);

  const handleClick = (id) => setSelected(p => p === id ? null : id);

  const relatedSet = selected
    ? new Set(relationships.filter(r => r.from === selected || r.to === selected).flatMap(r => [r.from, r.to]))
    : new Set();

  const activeRels = relationships.filter(r => r.from === selected || r.to === selected);

  const dbdiagramText = `Ref: Trip.user_id > User.user_id
Ref: FlightSearch.user_id > User.user_id
Ref: HotelSearch.user_id > User.user_id
Ref: Booking.user_id > User.user_id
Ref: LoyaltyAccount.user_id > User.user_id
Ref: Itinerary.trip_id > Trip.trip_id
Ref: Booking.trip_id > Trip.trip_id
Ref: FlightSearch.trip_id > Trip.trip_id
Ref: HotelSearch.trip_id > Trip.trip_id
Ref: ItineraryItem.itinerary_id > Itinerary.itinerary_id
Ref: FlightOffer.flight_search_id > FlightSearch.flight_search_id
Ref: HotelOffer.hotel_search_id > HotelSearch.hotel_search_id
Ref: Payment.booking_id - Booking.booking_id`;

  const handleCopy = () => {
    navigator.clipboard?.writeText(dbdiagramText);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div style={{ background: "#f8f9fc", minHeight: "100vh", fontFamily: "'DM Sans', 'Segoe UI', sans-serif", color: BRAND.text, display: "flex", flexDirection: "column" }}>
      {/* Header */}
      <header style={{
        background: BRAND.white, borderBottom: `1px solid ${BRAND.border}`,
        padding: "0 28px", height: 58,
        display: "flex", alignItems: "center", justifyContent: "space-between", flexShrink: 0,
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: 18 }}>
          <KitraviaLogo />
          <div style={{ width: 1, height: 22, background: BRAND.border }} />
          <span style={{ fontSize: 10, color: BRAND.muted, letterSpacing: "0.14em", textTransform: "uppercase", fontWeight: 600 }}>
            ER Diagram
          </span>
        </div>
        <div style={{ display: "flex", gap: 24 }}>
          {[{ v: "12", l: "Entities" }, { v: "13", l: "Relations" }, { v: "12", l: "1:M" }, { v: "1", l: "1:1" }].map(s => (
            <div key={s.l} style={{ textAlign: "center" }}>
              <div style={{ fontSize: 14, fontWeight: 800, color: BRAND.blue, lineHeight: 1 }}>{s.v}</div>
              <div style={{ fontSize: 9, color: BRAND.muted, letterSpacing: "0.08em", marginTop: 2 }}>{s.l}</div>
            </div>
          ))}
        </div>
      </header>

      <div style={{ display: "flex", flex: 1, overflow: "hidden" }}>
        {/* Left sidebar */}
        <aside style={{ width: 188, background: BRAND.white, borderRight: `1px solid ${BRAND.border}`, padding: "18px 0", flexShrink: 0, overflowY: "auto" }}>
          <div style={{ padding: "0 14px 10px", fontSize: 9, letterSpacing: "0.14em", color: BRAND.muted, fontWeight: 700, textTransform: "uppercase" }}>Groups</div>
          {groups.map(g => {
            const gc = GROUP_COLORS[g.key];
            const isActive = activeGroup === g.key;
            return (
              <button key={g.key} onClick={() => setActiveGroup(p => p === g.key ? null : g.key)} style={{
                display: "flex", alignItems: "center", gap: 9,
                width: "100%", padding: "9px 14px", border: "none",
                background: isActive ? gc.light : "transparent",
                cursor: "pointer", textAlign: "left",
                borderLeft: `3px solid ${isActive ? gc.accent : "transparent"}`,
                transition: "all 0.15s",
              }}>
                <div style={{ width: 8, height: 8, borderRadius: 2, background: gc.accent, opacity: isActive ? 1 : 0.4 }} />
                <span style={{ fontSize: 12, fontWeight: isActive ? 700 : 500, color: isActive ? gc.accent : BRAND.text }}>{g.label}</span>
                <span style={{ marginLeft: "auto", fontSize: 9, color: BRAND.muted, background: BRAND.gray, borderRadius: 8, padding: "1px 6px" }}>{g.ids.length}</span>
              </button>
            );
          })}

          <div style={{ padding: "18px 14px 0", borderTop: `1px solid ${BRAND.border}`, marginTop: 14 }}>
            <div style={{ fontSize: 9, letterSpacing: "0.14em", color: BRAND.muted, fontWeight: 700, textTransform: "uppercase", marginBottom: 10 }}>Legend</div>
            {[{ tag: "PK", color: "#8a6200", bg: "#fef3c7", label: "Primary Key" }, { tag: "FK", color: BRAND.blue, bg: "#dbeafe", label: "Foreign Key" }].map(l => (
              <div key={l.tag} style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 8 }}>
                <span style={{ fontSize: 9, fontWeight: 700, color: l.color, background: l.bg, padding: "1px 5px", borderRadius: 3, fontFamily: "monospace" }}>{l.tag}</span>
                <span style={{ fontSize: 10, color: BRAND.muted }}>{l.label}</span>
              </div>
            ))}
            <div style={{ marginTop: 10 }}>
              {[{ color: BRAND.blue, bg: BRAND.lightBlue, label: "1 : M" }, { color: BRAND.red, bg: BRAND.lightRed, label: "1 : 1" }].map(l => (
                <div key={l.label} style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 6 }}>
                  <span style={{ fontSize: 9, fontWeight: 700, color: l.color, background: l.bg, padding: "1px 6px", borderRadius: 8, fontFamily: "monospace" }}>{l.label}</span>
                  <span style={{ fontSize: 10, color: BRAND.muted }}>{l.label === "1 : M" ? "One to Many" : "One to One"}</span>
                </div>
              ))}
            </div>
          </div>
        </aside>

        {/* Main grid */}
        <main style={{ flex: 1, overflowY: "auto", padding: "22px 24px" }}>
          {selected && (
            <div style={{
              display: "flex", alignItems: "center", gap: 10,
              background: BRAND.lightBlue, border: `1px solid ${BRAND.blue}22`,
              borderRadius: 7, padding: "7px 14px", marginBottom: 18, fontSize: 12,
            }}>
              <span style={{ color: BRAND.blue, fontWeight: 600 }}>{selected}</span>
              <span style={{ color: BRAND.muted }}>· {activeRels.length} relationship{activeRels.length !== 1 ? "s" : ""}</span>
              <button onClick={() => setSelected(null)} style={{ marginLeft: "auto", fontSize: 11, color: BRAND.muted, background: "none", border: "none", cursor: "pointer" }}>✕</button>
            </div>
          )}

          {groups.filter(g => !activeGroup || g.key === activeGroup).map(g => {
            const gc = GROUP_COLORS[g.key];
            return (
              <div key={g.key} style={{ marginBottom: 28 }}>
                <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 12 }}>
                  <div style={{ width: 3, height: 14, borderRadius: 2, background: gc.accent }} />
                  <span style={{ fontSize: 10, fontWeight: 700, color: gc.accent, letterSpacing: "0.12em", textTransform: "uppercase" }}>{g.label}</span>
                  <div style={{ flex: 1, height: 1, background: BRAND.border }} />
                </div>
                <div style={{ display: "flex", gap: 12, flexWrap: "wrap" }}>
                  {g.ids.map(id => {
                    const entity = entities.find(e => e.id === id);
                    if (!entity) return null;
                    const isHighlighted = selected === id;
                    const isRelated = !isHighlighted && !!selected && relatedSet.has(id);
                    const isDimmed = !!selected && !isHighlighted && !isRelated;
                    return <EntityCard key={id} entity={entity} isHighlighted={isHighlighted} isRelated={isRelated} isDimmed={isDimmed} onClick={handleClick} />;
                  })}
                </div>
              </div>
            );
          })}
        </main>

        {/* Right panel */}
        <aside style={{ width: 288, background: BRAND.white, borderLeft: `1px solid ${BRAND.border}`, overflowY: "auto", flexShrink: 0, display: "flex", flexDirection: "column" }}>
          <div style={{ padding: "14px 14px 10px", borderBottom: `1px solid ${BRAND.border}`, fontSize: 9, letterSpacing: "0.14em", color: BRAND.muted, fontWeight: 700, textTransform: "uppercase", position: "sticky", top: 0, background: BRAND.white, zIndex: 1, display: "flex", alignItems: "center", justifyContent: "space-between" }}>
            <span>Relationships</span>
            {selected && <span style={{ color: BRAND.blue }}>{activeRels.length} active</span>}
          </div>

          <div style={{ flex: 1, overflowY: "auto" }}>
            {(selected ? activeRels : relationships).map((rel, i) => {
              const fromGc = GROUP_COLORS[entities.find(e => e.id === rel.from)?.group];
              const toGc = GROUP_COLORS[entities.find(e => e.id === rel.to)?.group];
              const isOne = rel.card === "1 : 1";
              return (
                <div key={i} style={{ padding: "10px 14px", borderBottom: `1px solid ${BRAND.gray}` }}>
                  <div style={{ display: "flex", alignItems: "center", gap: 5, marginBottom: 3 }}>
                    <span style={{ fontSize: 11, fontWeight: 700, color: fromGc?.accent || BRAND.text }}>{rel.from}</span>
                    <span style={{ fontSize: 9, color: BRAND.muted }}>─</span>
                    <span style={{
                      fontSize: 9, fontWeight: 700, fontFamily: "monospace",
                      color: isOne ? BRAND.red : BRAND.blue,
                      background: isOne ? BRAND.lightRed : BRAND.lightBlue,
                      padding: "1px 6px", borderRadius: 8,
                      border: `1px solid ${isOne ? BRAND.red + "28" : BRAND.blue + "28"}`,
                    }}>{rel.card}</span>
                    <span style={{ fontSize: 9, color: BRAND.muted }}>─</span>
                    <span style={{ fontSize: 11, fontWeight: 700, color: toGc?.accent || BRAND.text }}>{rel.to}</span>
                  </div>
                  <div style={{ fontSize: 10, color: BRAND.muted }}>{rel.note}</div>
                </div>
              );
            })}
          </div>

          {/* Export block */}
          <div style={{ borderTop: `1px solid ${BRAND.border}`, padding: 14 }}>
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 8 }}>
              <span style={{ fontSize: 9, letterSpacing: "0.12em", color: BRAND.muted, fontWeight: 700, textTransform: "uppercase" }}>dbdiagram.io</span>
              <button onClick={handleCopy} style={{
                fontSize: 10, color: copied ? "#0ea87e" : BRAND.blue,
                background: copied ? "#e6f8f3" : BRAND.lightBlue,
                border: "none", borderRadius: 5, padding: "3px 10px",
                cursor: "pointer", fontWeight: 600, transition: "all 0.2s",
              }}>{copied ? "✓ Copied" : "Copy"}</button>
            </div>
            <pre style={{
              fontSize: 9, color: BRAND.muted, background: BRAND.gray,
              borderRadius: 6, padding: 10, margin: 0,
              overflowX: "auto", lineHeight: 1.85,
              fontFamily: "monospace", whiteSpace: "pre-wrap",
            }}>{dbdiagramText}</pre>
          </div>
        </aside>
      </div>
    </div>
  );
}
