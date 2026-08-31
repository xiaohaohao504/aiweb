<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from 'vue'

// Tag color classes (default = violet).
const TAG_VIOLET = 'bg-[rgba(122,62,240,0.1)] text-tag-violet border-[rgba(122,62,240,0.12)]'
const TAG_BLUE   = 'bg-[rgba(78,84,240,0.1)] text-tag-blue border-[rgba(78,84,240,0.12)]'
const TAG_CYAN   = 'bg-[rgba(6,182,212,0.1)] text-tag-cyan border-[rgba(6,182,212,0.12)]'
const TAG_PINK   = 'bg-[rgba(236,72,153,0.1)] text-tag-pink border-[rgba(236,72,153,0.12)]'

// Projects data — single source of truth for the cards.
interface Work {
  thumb: string
  title: string
  desc: string
  tags: { label: string; cls: string }[]
  svg: string
}

const works: Work[] = [
  {
    thumb: 'bg-linear-to-br from-[rgba(122,62,240,0.15)] to-[rgba(78,84,240,0.1)]',
    title: 'AI Code Reviewer',
    desc: '智能代码审查工具，基于大语言模型的自动化代码质量分析。',
    tags: [
      { label: 'Python', cls: TAG_VIOLET },
      { label: 'LangChain', cls: TAG_BLUE },
      { label: 'GPT-4', cls: TAG_CYAN }
    ],
    svg: `
      <rect x="8" y="12" width="64" height="44" rx="6" stroke="rgba(167,139,250,0.5)" stroke-width="1.5"/>
      <rect x="16" y="22" width="20" height="3" rx="1.5" fill="rgba(167,139,250,0.4)"/>
      <rect x="16" y="29" width="32" height="3" rx="1.5" fill="rgba(167,139,250,0.25)"/>
      <rect x="16" y="36" width="26" height="3" rx="1.5" fill="rgba(167,139,250,0.25)"/>
      <circle cx="56" cy="36" r="8" stroke="rgba(110,116,248,0.4)" stroke-width="1.5"/>
      <rect x="24" y="60" width="32" height="8" rx="4" fill="rgba(122,62,240,0.2)"/>`
  },
  {
    thumb: 'bg-linear-to-br from-[rgba(78,84,240,0.15)] to-[rgba(6,182,212,0.1)]',
    title: 'Smart Dashboard',
    desc: '实时数据可视化面板，支持自然语言查询与智能图表生成。',
    tags: [
      { label: 'React', cls: TAG_BLUE },
      { label: 'TypeScript', cls: TAG_VIOLET },
      { label: 'D3.js', cls: TAG_CYAN }
    ],
    svg: `
      <rect x="10" y="14" width="26" height="52" rx="5" stroke="rgba(110,116,248,0.5)" stroke-width="1.5"/>
      <rect x="16" y="24" width="14" height="3" rx="1.5" fill="rgba(110,116,248,0.4)"/>
      <rect x="16" y="31" width="10" height="3" rx="1.5" fill="rgba(110,116,248,0.25)"/>
      <circle cx="23" cy="54" r="5" stroke="rgba(110,116,248,0.3)" stroke-width="1.5"/>
      <rect x="44" y="14" width="26" height="52" rx="5" stroke="rgba(103,232,249,0.5)" stroke-width="1.5"/>
      <rect x="50" y="24" width="14" height="3" rx="1.5" fill="rgba(103,232,249,0.4)"/>
      <rect x="50" y="31" width="10" height="3" rx="1.5" fill="rgba(103,232,249,0.25)"/>
      <rect x="50" y="38" width="12" height="3" rx="1.5" fill="rgba(103,232,249,0.25)"/>
      <path d="M36 36H44" stroke="rgba(122,62,240,0.4)" stroke-width="1.5" stroke-dasharray="2 2"/>`
  },
  {
    thumb: 'bg-linear-to-br from-[rgba(168,85,247,0.15)] to-[rgba(236,72,153,0.1)]',
    title: 'Design System AI',
    desc: 'AI 驱动的设计系统生成器，从自然语言描述自动生成组件库。',
    tags: [
      { label: 'Figma Plugin', cls: TAG_PINK },
      { label: 'Node.js', cls: TAG_VIOLET },
      { label: 'OpenAI', cls: TAG_BLUE }
    ],
    svg: `
      <circle cx="40" cy="36" r="20" stroke="rgba(249,168,212,0.5)" stroke-width="1.5"/>
      <circle cx="40" cy="36" r="8" stroke="rgba(167,139,250,0.4)" stroke-width="1.5"/>
      <path d="M40 16V12M40 60V56M60 36H64M16 36H20" stroke="rgba(249,168,212,0.3)" stroke-width="1.5" stroke-linecap="round"/>
      <path d="M54 22L57 19M23 53L26 50M54 50L57 53M23 19L26 22" stroke="rgba(167,139,250,0.25)" stroke-width="1.5" stroke-linecap="round"/>
      <rect x="28" y="64" width="24" height="4" rx="2" fill="rgba(168,85,247,0.2)"/>`
  }
]

const cards = ref<HTMLElement[]>([])
let observer: IntersectionObserver | null = null

onMounted(() => {
  // Scroll-triggered reveal (mirrors original IntersectionObserver behavior).
  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = '1'
          entry.target.style.transform = 'translateY(0)'
        }
      })
    },
    { threshold: 0.1, rootMargin: '0px 0px -40px 0px' }
  )
  cards.value.forEach((card) => observer?.observe(card))
})

onBeforeUnmount(() => {
  observer?.disconnect()
})
</script>

<template>
  <section id="works" data-component="works" class="relative z-[1] py-24">
    <div class="wrap">
      <div class="mb-16">
        <p class="text-xs font-medium uppercase tracking-[0.1em] text-primary mb-4">Selected Works</p>
        <h2 class="font-serif text-[clamp(32px,4vw,44px)] font-normal tracking-[-0.03em] leading-[1.15] mb-2">Recent Projects</h2>
        <p class="text-base font-light text-secondary max-w-[480px] leading-[1.6] tracking-[-0.01em]">A curated selection of AI-driven products and experiments.</p>
      </div>

      <div class="grid grid-cols-3 gap-6 max-[900px]:grid-cols-1 max-[900px]:max-w-[480px] max-[900px]:mx-auto">
        <article
          v-for="(work, i) in works"
          :key="i"
          ref="cards"
          data-component="work-card"
          class="group rounded-card border border-line bg-surface overflow-hidden cursor-pointer backdrop-blur-[8px] animate-fade-in-up transition-all duration-[350ms] hover:border-line-hover hover:shadow-[0_0_0_1px_rgba(255,255,255,0.14),0_8px_40px_-12px_rgba(122,62,240,0.2)] hover:-translate-y-1"
          :style="{ animationDelay: (0.1 + i * 0.1) + 's' }"
        >
          <div class="w-full aspect-[16/10] relative overflow-hidden">
            <div class="w-full h-full flex items-center justify-center text-[40px] transition-transform duration-[400ms] group-hover:scale-[1.04]" :class="work.thumb">
              <svg class="opacity-60 transition-opacity duration-[350ms] group-hover:opacity-85" width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg" v-html="work.svg"></svg>
            </div>
          </div>
          <div class="p-6">
            <h3 class="text-base font-medium tracking-[-0.02em] mb-2 leading-[1.4]">{{ work.title }}</h3>
            <p class="text-[13px] font-light text-muted leading-[1.55] mb-4 tracking-[-0.005em]">{{ work.desc }}</p>
            <div class="flex flex-wrap gap-2">
              <span
                v-for="(tag, ti) in work.tags"
                :key="ti"
                class="inline-flex items-center py-1 px-2.5 rounded-full text-[11px] font-medium tracking-[0.02em] border"
                :class="tag.cls"
              >{{ tag.label }}</span>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
