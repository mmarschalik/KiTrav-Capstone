# 🎨 KITRAVIA DESIGN SYSTEM

**Version:** 1.0  
**Last Updated:** Sprint 9  
**Status:** ✅ Active

---

## 📐 BRAND COLORS

### Primary Colors

| Color Name | Hex Code | Usage | Example |
|------------|----------|-------|---------|
| **Primary Blue** | `#004aad` | Headers, primary buttons, links | Main brand color |
| **Light Blue** | `#0066cc` | Gradient endpoints, hover states | Secondary brand color |
| **Accent Red** | `#fc0000` | CTAs, important actions, alerts | Attention grabber |

### Gradients

```css
/* Primary Blue Gradient (Default for buttons/headers) */
background: linear-gradient(135deg, #004aad 0%, #0066cc 100%);

/* Horizontal Blue Gradient */
background: linear-gradient(to right, #004aad, #0066cc);

/* Brand Gradient (Blue to Red) */
background: linear-gradient(to right, #004aad, #fc0000);
```

### Background Colors

| Color | Hex Code | Usage |
|-------|----------|-------|
| Light | `#f9fafb` | Page backgrounds |
| Blue Tint | `#eff6ff` | Info sections |
| Gray | `#f3f4f6` | Card backgrounds |

### Text Colors

| Type | Hex Code | Usage |
|------|----------|-------|
| Dark | `#111827` | Headings, primary text |
| Medium | `#6b7280` | Body text, descriptions |
| Light | `#9ca3af` | Placeholder, disabled |

### Status Colors

| Status | Hex Code | Usage |
|--------|----------|-------|
| Success | `#10b981` | Confirmations, completed |
| Warning | `#f59e0b` | Alerts, cautions |
| Error | `#ef4444` | Errors, rejections |
| Info | `#3b82f6` | Information, tips |

---

## 🔤 TYPOGRAPHY

### Font Families

```css
/* Headings */
font-family: 'Georgia', serif;

/* Body Text */
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 
             'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', 
             sans-serif;

/* Monospace (Code) */
font-family: 'Courier New', monospace;
```

### Font Sizes

| Element | Size | Weight | Usage |
|---------|------|--------|-------|
| H1 | 48px (3rem) | 700 | Page titles |
| H2 | 36px (2.25rem) | 700 | Section titles |
| H3 | 24px (1.5rem) | 600 | Card titles |
| H4 | 20px (1.25rem) | 600 | Subsections |
| Body Large | 18px (1.125rem) | 400 | Intro text |
| Body | 16px (1rem) | 400 | Default text |
| Small | 14px (0.875rem) | 400 | Labels, captions |
| Tiny | 12px (0.75rem) | 400 | Fine print |

### Font Weights

- **Regular:** 400
- **Medium:** 500
- **Semibold:** 600
- **Bold:** 700

---

## 🔘 BUTTONS

### Primary Button

```jsx
<button style={{
  background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)',
  color: '#ffffff',
  padding: '12px 24px',
  borderRadius: '12px',
  fontWeight: '600',
  fontSize: '16px',
  border: 'none',
  cursor: 'pointer',
  transition: 'all 0.3s ease'
}}>
  Primary Action
</button>
```

**Hover State:** `transform: scale(1.05)`, `box-shadow: 0 10px 25px rgba(0, 74, 173, 0.3)`

### Secondary Button

```jsx
<button style={{
  background: '#ffffff',
  color: '#004aad',
  border: '2px solid #004aad',
  padding: '12px 24px',
  borderRadius: '12px',
  fontWeight: '600',
  fontSize: '16px'
}}>
  Secondary Action
</button>
```

### Accent Button (Red)

```jsx
<button style={{
  background: '#fc0000',
  color: '#ffffff',
  padding: '12px 24px',
  borderRadius: '12px',
  fontWeight: '600',
  fontSize: '16px'
}}>
  Important Action
</button>
```

### Button Sizes

| Size | Padding | Font Size | Usage |
|------|---------|-----------|-------|
| Small | `8px 16px` | 14px | Compact actions |
| Medium | `12px 24px` | 16px | Default |
| Large | `16px 32px` | 18px | Primary CTAs |

---

## 📦 CARDS

### Standard Card

```jsx
<div style={{
  background: '#ffffff',
  border: '2px solid #e5e7eb',
  borderRadius: '12px',
  padding: '24px',
  boxShadow: '0 1px 3px rgba(0, 0, 0, 0.1)',
  transition: 'all 0.3s ease'
}}>
  Card Content
</div>
```

**Hover State:**
- `border-color: #004aad`
- `box-shadow: 0 10px 30px rgba(0, 74, 173, 0.1)`

### Card Specifications

| Property | Value | Notes |
|----------|-------|-------|
| Border Radius | 12px | Rounded corners |
| Border Width | 2px | Visible but subtle |
| Border Color | `#e5e7eb` | Light gray |
| Padding | 24px | Comfortable spacing |
| Shadow | `0 1px 3px rgba(0,0,0,0.1)` | Subtle depth |

---

## 📏 SPACING

### Padding & Margin Scale

| Name | Size | Usage |
|------|------|-------|
| xs | 4px | Tight spacing |
| sm | 8px | Small gaps |
| md | 12px | Default |
| lg | 16px | Comfortable |
| xl | 24px | Section spacing |
| 2xl | 32px | Large sections |
| 3xl | 48px | Major sections |

### Grid & Layout

- **Container Max Width:** 1280px (7xl)
- **Content Max Width:** 1024px (5xl)
- **Narrow Content:** 768px (3xl)
- **Column Gap:** 24px (xl)
- **Row Gap:** 24px (xl)

---

## 🎯 ICONS

### Icon Sizes

| Size | Dimension | Usage |
|------|-----------|-------|
| Small | 16px | Inline icons |
| Medium | 20px | Button icons |
| Large | 24px | Section icons |
| XL | 32px | Feature icons |

### Icon Colors

- **Primary Actions:** `#004aad`
- **Accents:** `#fc0000`
- **Neutral:** `#6b7280`
- **Success:** `#10b981`
- **Warning:** `#f59e0b`

---

## 📱 RESPONSIVE BREAKPOINTS

```css
/* Mobile First Approach */

/* Mobile */
@media (min-width: 320px) { }

/* Tablet */
@media (min-width: 768px) { }

/* Desktop */
@media (min-width: 1024px) { }

/* Large Desktop */
@media (min-width: 1280px) { }
```

---

## 🎨 COMPONENT STYLES

### Navigation Bar

- **Height:** 80px
- **Background:** White
- **Shadow:** `0 2px 8px rgba(0, 0, 0, 0.1)`
- **Active Tab:** Blue gradient background
- **Inactive Tab:** Gray text, white background

### Page Headers

- **Background:** Blue horizontal gradient
- **Padding:** 64px vertical, 24px horizontal
- **Text Color:** White
- **Title Size:** 48px (H1)

### Service Cards (Booking Page)

- **Border:** 2px solid #e5e7eb
- **Active Border:** 2px solid #004aad
- **Border Radius:** 16px
- **Padding:** 24px
- **Badge:** Red background (#fc0000)

### Form Elements

- **Input Height:** 48px
- **Border:** 2px solid #e5e7eb
- **Focus Border:** 2px solid #004aad
- **Border Radius:** 8px
- **Padding:** 12px 16px

---

## ✅ ACCESSIBILITY

### Color Contrast Ratios

All text must meet **WCAG AA standards:**

- **Normal text:** Minimum 4.5:1
- **Large text (18pt+):** Minimum 3:1
- **UI components:** Minimum 3:1

### Tested Combinations

| Foreground | Background | Ratio | Pass |
|------------|------------|-------|------|
| #111827 (text) | #ffffff (white) | 16.1:1 | ✅ AAA |
| #004aad (blue) | #ffffff (white) | 7.8:1 | ✅ AAA |
| #ffffff (white) | #004aad (blue) | 7.8:1 | ✅ AAA |
| #6b7280 (gray) | #ffffff (white) | 5.3:1 | ✅ AA |

---

## 🚫 DON'T USE

### ❌ Avoid These Colors

- **Purple** - `#9333ea`, `#a855f7`, `#c084fc` (Off-brand)
- **Orange** - `#f97316`, `#fb923c` (Use red instead)
- **Random Blues** - Any blue not in our palette

### ❌ Avoid These Patterns

- Mixing purple with blue gradients
- Using more than 3 colors in one component
- Overusing red (should be <15% of interface)
- Inconsistent border radius (stick to 8px, 12px, 16px)

---

## 📚 USAGE EXAMPLES

### Page Header

```jsx
<div style={{
  background: 'linear-gradient(to right, #004aad, #0066cc)',
  color: '#ffffff',
  padding: '64px 24px',
  textAlign: 'center'
}}>
  <h1 style={{
    fontFamily: 'Georgia, serif',
    fontSize: '48px',
    fontWeight: '700',
    marginBottom: '16px'
  }}>
    Page Title
  </h1>
  <p style={{
    fontSize: '18px',
    color: 'rgba(255, 255, 255, 0.9)'
  }}>
    Description text
  </p>
</div>
```

### Primary CTA Button

```jsx
<button style={{
  background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)',
  color: '#ffffff',
  padding: '16px 32px',
  borderRadius: '12px',
  fontSize: '18px',
  fontWeight: '600',
  border: 'none',
  cursor: 'pointer',
  boxShadow: '0 4px 12px rgba(0, 74, 173, 0.2)',
  transition: 'transform 0.2s ease, box-shadow 0.2s ease'
}}
onMouseEnter={e => {
  e.target.style.transform = 'scale(1.05)';
  e.target.style.boxShadow = '0 8px 24px rgba(0, 74, 173, 0.3)';
}}
onMouseLeave={e => {
  e.target.style.transform = 'scale(1)';
  e.target.style.boxShadow = '0 4px 12px rgba(0, 74, 173, 0.2)';
}}>
  Get Started
</button>
```

---

## 🔄 VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | Sprint 9 | Initial design system creation |

---

## 📞 QUESTIONS?

Contact design team or refer to `colors.js` for color constants.

**Always use the design system for consistency!** 🎨
