
# URL Pattern Mapping in Servlet

## 1. Basic URL Pattern Types

### 1.1 Prefix Mapping (`/example/*`)
- Maps URLs starting with a specific **path**.
- Handles all requests starting with `/example`.

#### Example:
```xml
<servlet-mapping>
    <servlet-name>ExampleServlet</servlet-name>
    <url-pattern>/example/*</url-pattern>
</servlet-mapping>
```
- Matches `/example/foo`, `/example/bar`, `/example/anything`.

#### Use Case:
- RESTful paths (e.g., `/api/*`).

---

### 1.2 Extension Mapping (`*.do`)
- Maps requests with a specific **file extension**.
- Handles all requests ending with `.do`.

#### Example:
```xml
<servlet-mapping>
    <servlet-name>ExampleServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
</servlet-mapping>
```
- Matches `/example.do`, `/user.do`, `/login.do`.

#### Use Case:
- Action-based paths (e.g., `*.action`, `*.do`).

---

### 1.3 Root Mapping (`/`)
- Maps the **root path**.
- Handles all requests to the root if no other mapping exists.

#### Example:
```xml
<servlet-mapping>
    <servlet-name>RootServlet</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>
```
- Matches `/`.

#### Caution:
- May conflict with **welcome files**.

---

### 1.4 Wildcard Mapping (`/*`)
- Maps **all requests**.
- Captures every request to the server, including JSP and static resources.

#### Example:
```xml
<servlet-mapping>
    <servlet-name>GlobalServlet</servlet-name>
    <url-pattern>/*</url-pattern>
</servlet-mapping>
```
- Matches `/`, `/foo`, `/bar/baz`, `/anything`.

#### Caution:
- Be careful as JSP or static resources like CSS/JS may also be handled by this mapping.

---

### 1.5 Exact Mapping (`/example`)
- Maps a **specific path**.
- Handles only exact requests.

#### Example:
```xml
<servlet-mapping>
    <servlet-name>ExampleServlet</servlet-name>
    <url-pattern>/example</url-pattern>
</servlet-mapping>
```
- Matches `/example` only, not `/example/foo`.

#### Use Case:
- Specific endpoints like `/login` or `/signup`.

---

## 2. Mapping Priority

The container processes mappings in the following order:
1. **Exact Mapping**: `/example`
2. **Prefix Mapping**: `/example/*`
3. **Extension Mapping**: `*.do`
4. **Wildcard Mapping**: `/*`

---

## 3. Examples

### 3.1 RESTful Service Mapping
```xml
<servlet-mapping>
    <servlet-name>ApiServlet</servlet-name>
    <url-pattern>/api/*</url-pattern>
</servlet-mapping>
```
- Handles `/api/users`, `/api/products`.

---

### 3.2 Extension-Based Mapping
```xml
<servlet-mapping>
    <servlet-name>ActionServlet</servlet-name>
    <url-pattern>*.action</url-pattern>
</servlet-mapping>
```
- Handles `/login.action`, `/register.action`.

---

### 3.3 Root Mapping
```xml
<servlet-mapping>
    <servlet-name>MainServlet</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>
```
- Handles all root requests.

---

## 4. Important Notes

1. **`/*` with JSP Handling**:
   - If `/*` is mapped, JSP requests will also be routed to the servlet.
   - Ensure `RequestDispatcher` is used to forward to JSP when needed.

2. **Mixing Extension and Path-Based Mappings**:
   - Avoid conflicts when mixing `*.do` and `/api/*`.

---

## Conclusion

- **`/example/*`**: For paths with a common prefix.
- **`*.do`**: For extension-based actions.
- **`/`**: For root requests.
- **`/*`**: For all requests (use cautiously).

Choose the appropriate pattern for your use case.
