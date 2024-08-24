package com.example.demo;

import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class ShutdownListener {

    @EventListener(ApplicationReadyEvent.class)
    public void onApplicationReady() {
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            // 在这里执行任何需要在应用关闭前完成的清理操作
            System.out.println("Application is shutting down gracefully...");
        }));
    }
}
