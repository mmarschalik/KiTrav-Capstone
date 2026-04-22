// Kitravia Brand Colors - Single Source of Truth
// Last Updated: Sprint 9

// Primary Brand Colors
export const colors = {
  // Primary Blues
  primaryBlue: '#004aad',
  lightBlue: '#0066cc',
  
  // Accent Red
  accentRed: '#fc0000',
  
  // Gradients
  blueGradient: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)',
  blueGradientHorizontal: 'linear-gradient(to right, #004aad, #0066cc)',
  brandGradient: 'linear-gradient(to right, #004aad, #fc0000)',
  
  // Background Colors
  backgroundLight: '#f9fafb',
  backgroundBlue: '#eff6ff',
  backgroundGray: '#f3f4f6',
  
  // Text Colors
  textDark: '#111827',
  textMedium: '#6b7280',
  textLight: '#9ca3af',
  
  // Status Colors
  success: '#10b981',
  warning: '#f59e0b',
  error: '#ef4444',
  info: '#3b82f6',
  
  // Border Colors
  borderLight: '#e5e7eb',
  borderMedium: '#d1d5db',
  
  // White & Black
  white: '#ffffff',
  black: '#000000',
};

// CSS-in-JS Gradient Helper
export const gradients = {
  blue: {
    background: colors.blueGradient,
  },
  blueHorizontal: {
    background: colors.blueGradientHorizontal,
  },
  brand: {
    background: colors.brandGradient,
  },
};

// Button Styles
export const buttonStyles = {
  primary: {
    background: colors.blueGradient,
    color: colors.white,
    padding: '12px 24px',
    borderRadius: '12px',
    fontWeight: '600',
  },
  secondary: {
    background: colors.white,
    color: colors.primaryBlue,
    border: `2px solid ${colors.primaryBlue}`,
    padding: '12px 24px',
    borderRadius: '12px',
    fontWeight: '600',
  },
  accent: {
    background: colors.accentRed,
    color: colors.white,
    padding: '12px 24px',
    borderRadius: '12px',
    fontWeight: '600',
  },
};

export default colors;
