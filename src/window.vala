/* window.vala
 *
 * Copyright 2022 Jack W.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Catay {
    [GtkTemplate (ui = "/uk/cetera/Catay/window.ui")]
    public class Window : Adw.PreferencesWindow {
        [GtkChild]
        private unowned Gtk.Button about;

        [GtkChild]
        private unowned Adw.ActionRow fflags_app;

        public Window (Gtk.Application app) {
            Object (application: app);
            about.clicked.connect (() => {
                var about = new Adw.AboutWindow () {
                    transient_for = this,
                    application_name = "Catay",
                    application_icon = "uk.cetera.Catay-symbolic",
                    developer_name = "Etcetera Development",
                    version = "0.1.0",
                    developers = { "Jack W. https://cetera.uk" },
                    license_type = Gtk.License.GPL_3_0,
                    website = "https://github.com/mollersuite/catay",
                    issue_url = "https://github.com/mollersuite/catay/issues",
                    support_url = "https://cetera.uk/discord"
                };

                about.present ();
            });

            fflags_app.activated.connect (() => {
                this.present_subpage (new Catay.FFlagEditor ());
            });
        }
    }
}
