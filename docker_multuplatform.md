
### **Multi-Platform Support**
If your image needs to run on systems with different architectures (e.g., `amd64`, `arm64`), use **multi-platform images** to avoid compatibility issues.

#### Steps:
1. Build a multi-platform image:
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64 -t <image_name>:<tag> .
   ```

2. Save the multi-platform image:
   ```bash
   docker save -o multi_platform_image.tar <image_name>:<tag>
   ```

---

