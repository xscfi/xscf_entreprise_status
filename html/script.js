window.addEventListener('message', (event) => {
    if (event.data.action === "showNotification") {
        let container = document.getElementById("notif-container");

        let notif = document.createElement("div");
        notif.classList.add("notification");

        notif.innerHTML = `
            <div class="notification-icon">${event.data.icon}</div>
            <div class="notification-content">
                <div class="notification-title">${event.data.title}</div>
                <div class="notification-message">${event.data.message}</div>
            </div>
        `;

        container.appendChild(notif);

        setTimeout(() => {
            notif.style.opacity = "0";
            setTimeout(() => notif.remove(), 400);
        }, 5000);
    }
});
