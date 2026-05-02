import React from 'react';

export default function KitraviaLogo({ size = 'normal', iconOnly = false }) {
  const sizes = {
    small: { height: '40px', iconHeight: '36px' },
    normal: { height: '64px', iconHeight: '58px' },
    large: { height: '96px', iconHeight: '86px' }
  };

  const s = sizes[size] || sizes.normal;

  if (iconOnly) {
    return (
      <img 
        src="/logo-icon-red.png" 
        alt="Kitravia" 
        style={{ height: s.iconHeight }}
        className="hover:scale-110 transition-transform duration-300"
      />
    );
  }

  return (
    <img 
      src="/logo-red.png" 
      alt="Kitravia" 
      style={{ height: s.height }}
      className="hover:scale-105 transition-transform duration-300"
    />
  );
}
