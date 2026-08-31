<script setup lang="ts">
// Site header — fixed, blurred, with logo + nav. Styled with Tailwind utilities.
</script>

<template>
  <header
    class="fixed top-0 inset-x-0 z-[100] py-4 backdrop-blur-[16px] backdrop-saturate-[1.8] bg-[rgba(9,9,11,0.72)] border-b border-line transition-colors duration-300"
    data-component="header"
  >
    <div class="wrap flex items-center justify-between">
      <div class="flex items-center gap-2 font-semibold text-[17px] tracking-[-0.03em]">
        <span class="w-7 h-7 rounded-[7px] bg-linear-to-br from-primary to-accent flex items-center justify-center text-[13px] font-semibold text-white shadow-[0_0_12px_rgba(122,62,240,0.3)]">C</span>
        CodeWithAI
      </div>
      <nav class="flex items-center gap-10 max-sm:gap-6">
        <a
          v-for="link in [{ href: '#about', label: '关于' }, { href: '#works', label: '作品' }, { href: '#contact', label: '联系我' }]"
          :key="link.href"
          :href="link.href"
          class="relative text-sm text-secondary tracking-[-0.01em] transition-colors duration-200 hover:text-paper max-sm:text-[13px] after:absolute after:-bottom-1 after:left-0 after:h-px after:w-0 after:bg-linear-to-r after:from-primary after:to-accent after:transition-all after:duration-300 after:ease-out hover:after:w-full after:content-['']"
        >{{ link.label }}</a>
      </nav>
    </div>
  </header>
</template>
