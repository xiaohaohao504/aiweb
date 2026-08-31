<script setup lang="ts">
import AppHeader from '~/components/AppHeader.vue'
import AppHero from '~/components/AppHero.vue'
import AppWorks from '~/components/AppWorks.vue'
import AppFooter from '~/components/AppFooter.vue'

// Cursor-following glow effect + smooth scroll for in-page anchors.
// Runs only on the client (onMounted is skipped during SSR).
onMounted(() => {
  const root = document.documentElement

  const onMouseMove = (e: MouseEvent) => {
    root.style.setProperty('--mouse-x', e.clientX + 'px')
    root.style.setProperty('--mouse-y', e.clientY + 'px')
  }
  document.addEventListener('mousemove', onMouseMove)

  // Smooth scroll for in-page navigation links (matches original behavior)
  const onClick = (e: MouseEvent) => {
    const target = e.target as HTMLElement | null
    const anchor = target?.closest('a[href^="#"]') as HTMLAnchorElement | null
    if (!anchor) return
    const href = anchor.getAttribute('href')
    if (!href || href === '#') return
    const el = document.querySelector(href)
    if (el) {
      e.preventDefault()
      el.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }
  }
  document.addEventListener('click', onClick)

  onBeforeUnmount(() => {
    document.removeEventListener('mousemove', onMouseMove)
    document.removeEventListener('click', onClick)
  })
})
</script>

<template>
  <div>
    <!-- Background layers -->
    <div class="bg-glow" id="bgGlow"></div>
    <div class="bg-grid"></div>

    <!-- Header -->
    <AppHeader />

    <main>
      <!-- Hero Section -->
      <AppHero />

      <!-- Divider -->
      <div class="wrap"><hr class="w-full border-0 border-t border-line"></div>

      <!-- Works Section -->
      <AppWorks />

      <!-- Divider -->
      <div class="wrap"><hr class="w-full border-0 border-t border-line"></div>
    </main>

    <!-- Footer -->
    <AppFooter />
  </div>
</template>
