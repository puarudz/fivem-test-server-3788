/* ─────────────────────────────────────────────
   SAMAEL CITY — Loading Screen Script
   Resource info HIDDEN for security
───────────────────────────────────────────── */

(function () {
    'use strict';

    // ── Background Slideshow ─────────────────────
    const bgImages = [
        'assets/bg.jpg', 'assets/bg1.jpg', 'assets/bg2.jpg', 'assets/bg3.jpg',
        'assets/bg4.jpg', 'assets/bg5.jpg', 'assets/bg6.jpg', 'assets/bg7.jpg',
        'assets/bg8.jpg',
    ];
    const bgImg1 = document.getElementById('bgImg1');
    const bgImg2 = document.getElementById('bgImg2');
    let currentBgIndex = 0;
    let isShowingBg1 = true;

    // Preload all background images for smoother transitions
    bgImages.forEach(src => {
        const img = new Image();
        img.src = src;
    });

    function nextBackground() {
        if (!bgImg1 || !bgImg2) return;
        currentBgIndex = (currentBgIndex + 1) % bgImages.length;
        const nextImage = bgImages[currentBgIndex];

        if (isShowingBg1) {
            bgImg2.src = nextImage;
            bgImg2.style.opacity = '1';
            bgImg1.style.opacity = '0';
        } else {
            bgImg1.src = nextImage;
            bgImg1.style.opacity = '1';
            bgImg2.style.opacity = '0';
        }
        isShowingBg1 = !isShowingBg1;
    }

    setInterval(nextBackground, 7000);

    // ── Immersive loading messages (hide resource names) ──
    const loadingMessages = [
        "Đang kết nối đến thành phố...",
        "Đang tải bản đồ thành phố...",
        "Đang khởi tạo hệ thống...",
        "Đang tải dữ liệu nhân vật...",
        "Đang đồng bộ thế giới...",
        "Đang thiết lập môi trường...",
        "Đang chuẩn bị thành phố...",
        "Đang tải phương tiện...",
        "Đang khởi tạo giao thông...",
        "Đang tải vật phẩm...",
        "Đang kết nối máy chủ...",
        "Sắp hoàn tất...",
    ];
    let loadingMsgIndex = 0;
    let lastMsgTime = 0;
    const MSG_INTERVAL = 2500; // Change message every 2.5s max

    function getNextLoadingMessage() {
        const now = Date.now();
        if (now - lastMsgTime < MSG_INTERVAL) return null;
        lastMsgTime = now;
        loadingMsgIndex = (loadingMsgIndex + 1) % loadingMessages.length;
        return loadingMessages[loadingMsgIndex];
    }

    // ── Tips rotation ──────────────────────────
    const tips = [
        "Chào mừng đến Samael City — nơi luật pháp và tội phạm cùng tồn tại.",
        "Hãy nhớ khóa xe khi rời đi, kẻ trộm luôn rình rập trong bóng tối.",
        "Cảnh sát không ngủ. Hãy lái xe cẩn thận nếu không muốn rắc rối.",
        "Bạn có thể kiếm tiền bằng nhiều cách — hợp pháp hoặc không.",
        "Đừng tin bất kỳ ai. Trong thành phố này, ai cũng có bí mật.",
        "Kiểm tra túi đồ thường xuyên. Vật phẩm có thể cứu mạng bạn.",
        "Tham gia nhóm để mạnh hơn. Một mình rất khó sống sót.",
        "Chợ trời là nơi tốt nhất để bán đồ với giá cao.",
        "Đừng quên ăn uống. Nhân vật đói sẽ mất máu dần dần.",
        "Sử dụng radio để liên lạc với đồng đội trong nhiệm vụ.",
        "Nhà xưởng cho phép bạn chế tạo vật phẩm hiếm.",
        "Thuê xe tại đại lý nếu chưa đủ tiền mua xe riêng.",
    ];

    const tipText = document.getElementById('tipText');
    const tipProgress = document.getElementById('tipProgress');
    let tipIndex = 0;
    const tipsIntervalDuration = 6000;

    function rotateTip() {
        if (!tipText) return;
        tipText.style.opacity = '0';

        if (tipProgress) {
            tipProgress.style.transition = 'none';
            tipProgress.style.width = '0%';
            void tipProgress.offsetWidth;
            tipProgress.style.transition = `width ${tipsIntervalDuration}ms linear`;
            tipProgress.style.width = '100%';
        }

        setTimeout(() => {
            tipIndex = (tipIndex + 1) % tips.length;
            tipText.textContent = tips[tipIndex];
            tipText.style.opacity = '1';
        }, 400);
    }

    rotateTip();
    setInterval(rotateTip, tipsIntervalDuration);

    // ── Particles ──────────────────────────────
    const particlesContainer = document.getElementById('particles');

    function createParticle() {
        if (!particlesContainer) return;
        const particle = document.createElement('div');
        particle.className = 'particle';

        const x = Math.random() * 100;
        const size = Math.random() * 2 + 1;
        const duration = Math.random() * 8 + 6;
        const delay = Math.random() * 4;

        particle.style.left = x + '%';
        particle.style.bottom = '-10px';
        particle.style.width = size + 'px';
        particle.style.height = size + 'px';
        particle.style.animationDuration = duration + 's';
        particle.style.animationDelay = delay + 's';

        if (Math.random() > 0.5) {
            particle.style.background = 'rgba(255,255,255,0.5)';
        } else {
            particle.style.background = 'rgba(232,93,111,0.3)';
        }

        particlesContainer.appendChild(particle);

        setTimeout(() => {
            particle.remove();
        }, (duration + delay) * 1000);
    }

    for (let i = 0; i < 30; i++) {
        createParticle();
    }

    setInterval(() => {
        if (particlesContainer && particlesContainer.children.length < 40) {
            createParticle();
        }
    }, 800);

    // ── Loading progress ───────────────────────
    // Following nv_loadingscreen: loadFraction is the SINGLE source of truth
    const loadingFill = document.getElementById('loadingFill');
    const loadingPercent = document.getElementById('loadingPercent');
    const loadingText = document.getElementById('loadingText');

    let currentProgress = 0;
    let displayedProgress = 0;
    let animationFrame = null;

    // Smooth animated counter
    function animateProgress() {
        if (displayedProgress < currentProgress) {
            const diff = currentProgress - displayedProgress;
            displayedProgress += Math.max(0.5, diff * 0.1);
            if (displayedProgress > currentProgress) displayedProgress = currentProgress;
        }

        const rounded = Math.round(displayedProgress);
        if (loadingFill) loadingFill.style.width = rounded + '%';
        if (loadingPercent) loadingPercent.textContent = rounded + '%';

        if (displayedProgress < currentProgress) {
            animationFrame = requestAnimationFrame(animateProgress);
        } else {
            animationFrame = null;
        }
    }

    function updateProgress(percent) {
        percent = Math.min(100, Math.max(0, percent));
        if (percent > currentProgress) {
            currentProgress = percent;
            if (!animationFrame) {
                animationFrame = requestAnimationFrame(animateProgress);
            }
        }
    }

    // ── FiveM Loading Events ──
    // Only loadProgress with loadFraction drives the percentage (like nv_loadingscreen)
    // Other events only update the loading message text
    const handlers = {
        startInitFunction(data) {
            const msg = getNextLoadingMessage();
            if (msg && loadingText) loadingText.textContent = msg;
        },
        startInitFunctionOrder(data) {
            // No longer used for progress calculation
        },
        initFunctionInvoking(data) {
            const msg = getNextLoadingMessage();
            if (msg && loadingText) loadingText.textContent = msg;
        },
        startDataFileEntries(data) {
            if (loadingText) loadingText.textContent = "Đang tải dữ liệu thành phố...";
        },
        performMapLoadFunction(data) {
            const msg = getNextLoadingMessage();
            if (msg && loadingText) loadingText.textContent = msg;
        },
        loadProgress(data) {
            // This is the ONLY event that updates the percentage
            // Exactly like nv_loadingscreen: num = (e.data.loadFraction * 100).toFixed(0)
            if (data.loadFraction !== undefined) {
                let num = Math.round(data.loadFraction * 100);
                updateProgress(num);
            }
        },
        onLogLine(data) {
            // Don't show log messages (may contain resource info)
        }
    };

    window.addEventListener('message', (event) => {
        const data = event.data;
        if (!data || !data.eventName) return;

        const handler = handlers[data.eventName];
        if (handler) handler(data);
    });

    // ── Keyboard shortcut ──────────────────────
    window.addEventListener('keydown', (event) => {
        if (event.key === 'Escape' && currentProgress >= 95) {
            document.body.style.transition = 'opacity 0.6s ease';
            document.body.style.opacity = '0';
        }
    });

    // ── Music Player ─────────────────────────
    const musicToggle = document.getElementById('musicToggle');
    const musicPlayer = document.getElementById('musicPlayer');
    const bgMusic = document.getElementById('bgMusic');
    let musicMuted = false;

    if (bgMusic) {
        bgMusic.volume = 0.5;
        bgMusic.currentTime = 27;
        bgMusic.play().catch(() => {
            document.addEventListener('click', function playOnce() {
                bgMusic.currentTime = 27;
                bgMusic.play();
                document.removeEventListener('click', playOnce);
            }, { once: true });
        });
    }

    if (musicToggle && bgMusic && musicPlayer) {
        musicToggle.addEventListener('click', () => {
            musicMuted = !musicMuted;
            musicPlayer.classList.toggle('muted', musicMuted);
            bgMusic.muted = musicMuted;
        });
    }

})();
