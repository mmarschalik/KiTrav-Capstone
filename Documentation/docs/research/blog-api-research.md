# Blog API Research Report

Project: KiTrav - AI-Powered Travel Planner & Booking Platform  
Team: Maria Marschalik Lucan, Sean Bradley Ng, Kah Kiat Liew, Ishaan Kurmi, Rajlaxmi Bahirat  
Date: October 14, 2025  
Sprint: Sprint 2  

---

## Executive Summary

Evaluated six CMS options for travel blog integration. Strapi selected as optimal solution due to zero licensing cost, Node.js/PostgreSQL compatibility, and modern headless architecture.

Key Results:
- Solution: Strapi (open-source headless CMS)
- Cost: $120-180 for 6 months (AWS hosting only)
- Savings: 93% vs. commercial alternatives ($1,620 saved)
- Timeline: 3-4 weeks implementation (38 hours)
- Deployment: Sprint 5 (November 2025)

---

## Research Objective

Find CMS with clean API for React frontend, easy content creation for non-technical users, cost-effective for student budget, and modern scalable architecture.

---

## Solutions Evaluated

### 1. Strapi ( RECOMMENDED)
Type: Open-source headless CMS | Stack: Node.js + PostgreSQL | Cost: $0 license + $20-30/month AWS = $120-180 (6 months) 
Pros: Free, modern, full control, matches our stack, RESTful + GraphQL APIs  
Cons: Requires self-hosting

### 2. Contentful
Cost: $300/month = $1,800 (6 months) | Pros: Fully managed, enterprise features | Cons: Too expensive | Decision: Rejected

### 3. WordPress REST API
Cost: $5-10/month = $30-60 (6 months) | Pros: Very easy, cheap | Cons: Outdated tech (PHP) | Decision: Rejected

### 4. Sanity.io
Cost: $0-199/month = $0-1,194 (6 months) | Cons: Complex learning curve | Decision:  Rejected

### 5. Ghost
Cost: $11-36/month = $66-216 (6 months) | Cons: Less flexible | Decision:  Rejected

### 6. Medium API
Cost: $0 | Cons: Insufficient API | Decision: Rejected

---

## Why Strapi?

1. Cost: $0 license (open-source) + cheap AWS hosting
2. Tech Fit: Node.js + PostgreSQL = perfect match with our stack
3. APIs: Both RESTful and GraphQL support
4. Control: Full customization, no vendor lock-in
5. Learning: Modern headless CMS experience for portfolios

---

## Implementation Plan

Phase 1: Local Setup (Week 1 - 7 hours) - Install Strapi, create content types (posts, categories, authors), configure API permissions, add sample content  
Phase 2: AWS Deployment (Week 2 - 6 hours) - Set up RDS PostgreSQL, configure S3 media storage, deploy to EC2, test production  
Phase 3: Frontend Integration (Week 2-3 - 10 hours) - Build React components (BlogList, BlogCard, BlogPost), create API service layer, add routing  
Phase 4: Content Creation (Week 3-4 - 15 hours) - Write 7-10 blog posts, optimize images, add SEO metadata, publish live

Total: 38 hours over 3-4 weeks

---

## Technical Architecture
```
React Frontend (Vercel)
    ↓ HTTPS API Calls
Strapi CMS (AWS EC2)
    ↓               ↓
PostgreSQL (RDS)   S3 (Images)
```

### API Integration Example
```javascript
// blogAPI.js - Handles all Strapi API calls
import axios from 'axios';

const STRAPI_URL = process.env.REACT_APP_STRAPI_URL;
const API_TOKEN = process.env.REACT_APP_STRAPI_TOKEN;

const strapiAPI = axios.create({
  baseURL: `${STRAPI_URL}/api`,
  headers: { 'Authorization': `Bearer ${API_TOKEN}` }
});

// Fetch all blog posts with populated fields
export const getAllPosts = async () => {
  const response = await strapiAPI.get('/blog-posts', {
    params: { 
      populate: ['heroImage', 'category', 'author'],
      sort: 'publishedAt:desc'
    }
  });
  return response.data;
};

// Fetch single post by slug
export const getPostBySlug = async (slug) => {
  const response = await strapiAPI.get('/blog-posts', {
    params: { 
      filters: { slug: { $eq: slug } },
      populate: ['heroImage', 'category', 'author']
    }
  });
  return response.data.data[0];
};

// Fetch posts by category
export const getPostsByCategory = async (categorySlug) => {
  const response = await strapiAPI.get('/blog-posts', {
    params: {
      filters: { category: { slug: { $eq: categorySlug } } },
      populate: ['heroImage', 'category', 'author']
    }
  });
  return response.data;
};
```

---

## Budget Analysis

Monthly Costs:
- AWS EC2 (t2.micro): $8/month
- AWS RDS (db.t3.micro): $12/month
- AWS S3 storage: $2-5/month
- **Total: $22-25/month**

6-Month Total: $132-150

Savings: Contentful costs $1,800 → Strapi costs $150 → Saved $1,650 (92% reduction)

---

## Blog Categories

1. Destination Guides - City itineraries, country overviews, hidden gems
2. Travel Tips & Hacks - Budget tips, booking secrets, safety advice
3. Packing Guides - Essential lists, gear reviews, climate-specific
4. Travel Planning - Step-by-step guides, visa info, insurance
5. Food & Culture - Local cuisine, cultural etiquette, language basics
6. Travel Stories - Personal experiences, inspiration, interviews

---

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| AWS costs exceed budget | Set billing alerts at $25/month, monitor weekly |
| Learning curve delays | Use Strapi documentation, allocate extra 3 hours buffer |
| Content creation delays | Start early, distribute work across team members |
| Deployment issues | Test locally first, document deployment process step-by-step |
| Security vulnerabilities | Regular Strapi updates, secure API tokens, HTTPS only |

---

## Next Steps

Sprint 2 (Current):
- [x] Complete CMS research and evaluation
- [x] Document findings and recommendations
- [x] Get team approval on Strapi selection

Sprint 4 (Preparation):
- [ ] Set up local Strapi instance for testing
- [ ] Create content type schemas
- [ ] Write 2-3 sample blog posts
- [ ] Design blog UI components in Figma

Sprint 5 (Implementation):
- [ ] Deploy Strapi to AWS (EC2, RDS, S3)
- [ ] Integrate with React frontend
- [ ] Publish initial 7-10 blog posts
- [ ] QA testing and launch

---

## Resources

- Strapi Official Docs: https://docs.strapi.io/
- AWS Deployment Guide: https://docs.strapi.io/dev-docs/deployment/amazon-aws
- Community Support: https://discord.strapi.io/
- Full Documentation: `/docs/features/travel-blog-section.md`
