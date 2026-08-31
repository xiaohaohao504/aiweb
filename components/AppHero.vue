<script setup lang="ts">
// Hero section — full-viewport intro. Styled with Tailwind utilities.
</script>

<template>
  <section
    id="about"
    data-component="hero"
    class="relative min-h-screen flex items-center justify-center text-center pt-32 pb-24 max-sm:pt-24 max-sm:pb-16"
  >
    <div class="hero-glow animate-breathe"></div>
    <div class="wrap">
      <div class="max-w-[720px]">
        <div class="inline-flex items-center gap-2 py-1.5 pl-2 pr-4 rounded-full border border-line bg-surface text-[13px] text-secondary tracking-[-0.01em] mb-10 backdrop-blur-[8px] animate-fade-in-up">
          <span class="w-2 h-2 rounded-full bg-green shadow-[0_0_8px_rgba(34,197,94,0.5)] animate-pulse-dot"></span>
          Open to collaborate
        </div>
        <h1 class="font-serif text-[clamp(48px,7vw,82px)] font-normal leading-[1.05] tracking-[-0.035em] mb-6 animate-fade-in-up [animation-delay:0.1s]">
          <span class="bg-linear-to-br from-primary to-accent bg-clip-text text-transparent">AI-Powered</span><br>Developer
        </h1>
        <p class="text-[clamp(17px,2vw,20px)] font-light text-secondary leading-[1.5] tracking-[-0.014em] max-w-[520px] mx-auto mb-10 animate-fade-in-up [animation-delay:0.2s]">
          Building the future with Qoder &amp; Trae — crafting intelligent experiences at the intersection of design and code.
        </p>
        <div class="flex items-center justify-center gap-4 animate-fade-in-up [animation-delay:0.3s] max-sm:flex-col max-sm:gap-2">
          <a href="#works" class="inline-flex items-center gap-2 py-[11px] px-6 rounded-full font-sans text-sm font-medium tracking-[-0.01em] cursor-pointer transition-all duration-[250ms] bg-linear-to-br from-primary to-accent text-white shadow-[0_0_20px_rgba(122,62,240,0.25),inset_0_1px_0_rgba(255,255,255,0.1)] hover:shadow-[0_0_32px_rgba(122,62,240,0.4),inset_0_1px_0_rgba(255,255,255,0.15)] hover:-translate-y-px max-sm:w-full max-sm:justify-center">
            <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.64 0 8.577 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.64 0-8.577-3.007-9.963-7.178Z" /><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" /></svg>
            浏览作品
          </a>
          <a href="#contact" class="inline-flex items-center gap-2 py-[11px] px-6 rounded-full font-sans text-sm font-medium tracking-[-0.01em] cursor-pointer transition-all duration-[250ms] border border-line bg-surface text-paper backdrop-blur-[8px] hover:bg-surface-hover hover:border-line-hover hover:-translate-y-px max-sm:w-full max-sm:justify-center">
            <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" /></svg>
            联系我
          </a>
        </div>
      </div>
    </div>
  </section>
</template>
