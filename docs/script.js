let tick = 0;

function animate() {
    tick += 0.02; // Controls the speed of the bobbing
    
    const containers = document.querySelectorAll('.art-container');
    
    containers.forEach((container, index) => {
        // This creates the "bobbing" effect without CSS keyframes
        // It offsets each item slightly so they don't move in perfect sync
        const yOffset = Math.sin(tick + index) * 15;
        container.style.marginTop = `${yOffset}px`;
    });

    requestAnimationFrame(animate);
}

// Handle the Tilt
document.addEventListener('mousemove', (e) => {
    const artifacts = document.querySelectorAll('.artifact');
    const moveX = (window.innerWidth / 2 - e.pageX) / 40;
    const moveY = (window.innerHeight / 2 - e.pageY) / 40;

    artifacts.forEach(art => {
        art.style.transform = `rotateY(${moveX}deg) rotateX(${moveY}deg)`;
    });
});

// Start the animation loop
animate();