

### **Verify Integrity**
To ensure the `.tar` file isn't corrupted during transfer, you can verify its integrity with a checksum.

#### Steps:
1. Generate an MD5 checksum on the source server:
   ```bash
   md5sum my_image.tar > my_image.tar.md5
   ```

2. Transfer both the `.tar` file and the `.md5` file to the target server.

3. Verify the checksum on the target server:
   ```bash
   md5sum -c my_image.tar.md5
   ```

If the checksum matches, the file integrity is intact.

---
