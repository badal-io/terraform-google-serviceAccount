module "serviceAccount" {
    source  = "github.com/muvaki/terraform-google-serviceAccount"

    name            = "muvaki-test-serviceAccount"
    description     = "Muvaki Test Service Account"

    key = {
        enabled = "true",
        pgp_key = "LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdudVBHIHYxLjQuOSAoRGFyd2luKQogCm1RRU5CRXJKTTZvQkNBQzdORzVOWjVraUpnK0tUVGFJRGpYOUJVOGJjN0ZJNWEyekNZYzNwOWVpa0pmeXlaWU0KLi4uCnNXYmNrdmNJakpSY0F0UmxpS2JBZitLanBsYmNFSXp0K2t4bXdlRTVYZUt2REZ0ekFEMDQxRkdBcGhJa0tjdXUKSUF6TCtYY01XemMzREE9PQo9K29qegotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0t"
    }
}