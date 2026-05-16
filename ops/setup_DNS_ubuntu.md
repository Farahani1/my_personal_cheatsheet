The `/etc/resolv.conf` file on modern Linux distributions is often managed dynamically by services like `NetworkManager`, `systemd-resolved`, or other network configuration tools. To set DNS servers permanently, you need to configure the respective service responsible for managing it. Here's how:

---

### **1. Identify the Managing Service**
Check which service manages `/etc/resolv.conf`:
```bash
ls -l /etc/resolv.conf
```
The output might indicate a symbolic link pointing to a service, such as:
- `/run/systemd/resolve/stub-resolv.conf` (managed by `systemd-resolved`)
- `/var/run/NetworkManager/resolv.conf` (managed by `NetworkManager`)

---

### **2. Configure DNS for the Managing Service**
#### **For `systemd-resolved`:**
1. Edit the `systemd-resolved` configuration file:
   ```bash
   sudo nano /etc/systemd/resolved.conf
   ```
2. Add or update the DNS settings under `[Resolve]`:
   ```
   [Resolve]
   DNS=8.8.8.8 8.8.4.4
   FallbackDNS=1.1.1.1 1.0.0.1
   ```
   Replace the IPs with your preferred DNS servers (e.g., Google DNS, Cloudflare, etc.).

3. Restart `systemd-resolved` to apply changes:
   ```bash
   sudo systemctl restart systemd-resolved
   ```

4. Recreate the `/etc/resolv.conf` symlink (if necessary):
   ```bash
   sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
   ```

---

#### **For `NetworkManager`:**
1. Edit the NetworkManager configuration file:
   ```bash
   sudo nano /etc/NetworkManager/NetworkManager.conf
   ```
2. Add or update the `[main]` section to include:
   ```
   [main]
   dns=none
   ```
   This disables NetworkManager's DNS handling.

3. Set static DNS in your network interface configuration:
   - For example, edit the file `/etc/NetworkManager/system-connections/<your-connection>.nmconnection`:
     ```bash
     sudo nano /etc/NetworkManager/system-connections/<your-connection>.nmconnection
     ```
   - Add DNS settings:
     ```
     [ipv4]
     method=manual
     dns=8.8.8.8;8.8.4.4;
     ```
   - Save and exit.

4. Restart NetworkManager:
   ```bash
   sudo systemctl restart NetworkManager
   ```

---

#### **For Static IP Configuration:**
If you're using a static IP configuration:
1. Edit your network configuration file (e.g., `/etc/netplan/*.yaml` if using `netplan`):
   ```bash
   sudo nano /etc/netplan/01-netcfg.yaml
   ```
2. Add the DNS servers:
   ```yaml
   network:
     version: 2
     ethernets:
       eth0:
         addresses:
           - 192.168.1.100/24
         gateway4: 192.168.1.1
         nameservers:
           addresses:
             - 8.8.8.8
             - 8.8.4.4
   ```
3. Apply the changes:
   ```bash
   sudo netplan apply
   ```

---

### **3. Verify the New DNS Settings**
After making the changes, confirm the DNS settings:
```bash
cat /etc/resolv.conf
```
You should see your configured DNS servers.

---

### **4. Prevent Overwriting (Optional)**
If needed, you can make `/etc/resolv.conf` immutable to prevent it from being modified:
```bash
sudo chattr +i /etc/resolv.conf
```
To allow changes later:
```bash
sudo chattr -i /etc/resolv.conf
```

By following the above steps, you can ensure your DNS configuration remains persistent across reboots and network changes.